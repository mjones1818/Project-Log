class Project < ApplicationRecord
  has_many :project_parts
  has_many :parts, through: :project_parts

  belongs_to :user
  belongs_to :type

  has_many_attached :images
 
  accepts_nested_attributes_for :parts, allow_destroy: true

  validates :name, presence: true
  validates :brief_description, presence: true
  validates(:brief_description, { :length => { :in => 6..255 } })
  validates :images, attached: true
  validates :images, limit: {min: 1, max: 10, message: "- Attach 1- 10 photos"}
  scope :public_projects, -> {where("public = true")}
end
