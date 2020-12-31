class Part < ApplicationRecord
  has_many :project_parts
  has_many :projects, through: :project_parts
  accepts_nested_attributes_for :project_parts, allow_destroy: true
  validates :name, presence: true
  
  def get_quantity(project)
    ProjectPart.find_by()
  end


end
