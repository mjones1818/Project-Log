class ProjectsController < ApplicationController
  
  def new
    @project = Project.new
    #@project_part = @project.project_parts.build
    #@project_part = @project_part.build_part

    render 'new'
  end

  def create
    byebug
    @project = Project.new(project_params)
    @project.user_id = User.first.id
    
    #project.user_id = session[:user_id]
    if @project.save #this is where validations happen
      @project.parts.each
      @project.images.purge
      @project.images.attach(project_params[:images])
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

  private

  def get_project
    @project = Project.find_by(id: params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :brief_description, :main_description, :public, :type_id, :user_id, images: [], parts_attributes: [:id, :name, :description, :link, :created_at, :updated_at, :_destroy])
  end

  def part_params
    params.require(:project).permit(parts_attributes: [project_parts_attributes: [:quantity]])
  end

  def all_params
    params.require(:project).permit(:name, :brief_description, :main_description, :public, :type_id, :user_id, images: [], parts_attributes: [:id, :name, :description, :link, :created_at, :updated_at, :_destroy, project_parts_attributes: [:quantity]])
  end

  def quantity(part)
    ProjectPart.where(project_id: @project.id, part_id: part.id).first.quantity
  end
end

#Part.attribute_names.map(&:to_sym).push(:_destroy)