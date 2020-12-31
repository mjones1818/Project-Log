class Type < ApplicationRecord
  has_many :projects
  scope :type, ->(type) {where("name = ?", type)}
end
