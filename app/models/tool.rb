class Tool < ApplicationRecord
  has_many :project_parts
  has_many :tools, through: :project_parts
  validates :name, presence: true
end
