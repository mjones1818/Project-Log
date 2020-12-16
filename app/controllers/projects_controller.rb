class ProjectsController < ApplicationController
  
  def new
    @project = Project.new
  end

  def create
    project = Project.new(project_params)
    if project.save #this is where validations happen
      project.images.purge
      project.images.attach(project_params[:images])
      redirect_to project_path(project)
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
    params.require(:project).permit(:name, :type_id, :user_id, images: [])
  end
end
