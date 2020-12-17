class ProjectPart < ApplicationRecord
  belongs_to :part
  belongs_to :project
  accepts_nested_attributes_for :part, :reject_if => :all_blank
end