class ProjectsController < ApplicationController
  
  
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
end
