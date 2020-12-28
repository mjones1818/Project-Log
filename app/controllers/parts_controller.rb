class PartsController < ApplicationController
  before_action :require_login
  def new
    
  end

  def index

  end

  def show

  end

  def create

  end

  def destroy

  end

  def edit

  end

  def update
    
  end

  def quantities
    @project = Project.find_by(id: params[:id])
    @quantities = []
    @project.parts.each do 
    # <%= number_field_tag "part#{part.id}[quantity]" %>
    end
  end

  def quantity_update
    @project = Project.find_by(id: params[:id])
    part_params.each_key do |key|
      project_part = @project.project_parts.find_by(part_id: key)
      project_part.quantity = part_params[key][:quantity]
      project_part.save
    end
    redirect_to project_path(@project)
  end
  
  private
  def require_login
    redirect_to signin_path unless session.include? :user_id
  end

  def part_params
    params.require(:part).permit!
  end
end
