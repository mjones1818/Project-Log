class User < ApplicationRecord
  has_many :projects
  has_secure_password
  validates :email, uniqueness: true
  validates :name, presence: true
  validates(:password, { :length => { :in => 6..20 } })
end
