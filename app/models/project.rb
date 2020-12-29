class Project < ApplicationRecord
  has_many :project_parts
  has_many :parts, through: :project_parts

  has_many :project_tools
  has_many :tools, through: :project_tools

  belongs_to :user
  belongs_to :type

  has_many_attached :images
 
  accepts_nested_attributes_for :parts, allow_destroy: true

  
end
