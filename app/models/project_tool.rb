class ProjectTool < ApplicationRecord
  belongs_to :tool
  belongs_to :project
end