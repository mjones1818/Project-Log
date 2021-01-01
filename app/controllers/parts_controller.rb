class PartsController < ApplicationController
  before_action :require_login

  def show
    @part = Part.find_by(id: params[:id])
  end

  def quantities
    @project = Project.find_by(id: params[:id])
    @quantities = []
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
