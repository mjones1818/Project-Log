class Part < ApplicationRecord
  has_many :project_parts
  has_many :projects, through: :project_parts

  def get_quantity(project)
    ProjectPart.find_by()
  end
end
