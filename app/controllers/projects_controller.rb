class ProjectsController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: [:index]

  def new
    @project = Project.new
    render 'new'
  end

  def create
    byebug
    @project = Project.new(project_params)
    @project.user_id = session[:user_id]
    @project.save
    @project.part_ids += existing_parts
    if @project.save #this is where validations happen
      @project.images.purge
      @project.images.attach(project_params[:images])
      if @project.parts.any?
        redirect_to quantity_path(@project) and return
      end
      redirect_to project_path(@project)
    else
      render :new
    end
  end


  def index
    @projects = Project.all
  end

  def show
    @project = Project.find_by(id: params[:id])
  end

  def delete
    @project = Project.find_by(id: params[:id])
    if @project.user == helpers.current_user
      @project.destroy
      redirect_to user_path(@project.user)
    else
      flash[:warning] = "Unable to delete a different user's project!"
      redirect_to project_path(@project)
    end
  end

  def edit
    @project = Project.find_by(id: params[:id])
    @parts = Part.where.not(id: @project.part_ids)
  end

  def update
    
    @project = Project.find_by(id: params[:id])
    byebug
    @project.update(project_params)
    @project.part_ids += existing_parts
    if @project.save #this is where validations happen
      if !project_params[:images].nil?
        @project.images.purge
        @project.images.attach(project_params[:images])
      end
      if @project.parts.any?
        redirect_to "/project/#{@project.id}/parts/quantities" and return
        render 'parts/new'
      end
      redirect_to project_path(@project)
    else
      render :new
    end
  end

  private
  
  def require_login
    flash[:notice] = SIGN_IN_ERROR
    redirect_to signin_path unless session.include? :user_id
  end

  def get_project
    @project = Project.find_by(id: params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :brief_description, :main_description, :public, :type_id, :user_id, images: [], parts_attributes: [:id, :name, :description, :link, :created_at, :updated_at, :_destroy])
  end

  def part_params
    params.require(:project).permit(parts_attributes: [:name, project_part: [:quantity]])
  end

  def existing_parts
    params.require(:project).permit(parts: [])[:parts]
  end

  def part_param
    part_params[:parts_attributes].each do |key, value|
      byebug
    end
  end

  def all_params
    params.require(:project).permit(:name, :brief_description, :main_description, :public, :type_id, :user_id, images: [], parts_attributes: [:id, :name, :description, :link, :created_at, :updated_at, :_destroy, project_parts_attributes: [:quantity]])
  end

  def quantity(part)
    ProjectPart.where(project_id: @project.id, part_id: part.id).first.quantity
  end
end

#Part.attribute_names.map(&:to_sym).push(:_destroy)