class ProjectPart < ApplicationRecord
  belongs_to :part
  belongs_to :project
  #accepts_nested_attributes_for :part

  def self.set_quantity(project, part, quantity)
    ProjectPart.where(project_id: @project.id, part_id: part.id).first.quantity
  end

end