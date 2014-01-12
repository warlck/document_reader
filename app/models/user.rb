class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
end
