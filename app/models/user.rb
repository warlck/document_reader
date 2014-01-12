class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true

  before_create { generate_token(:auth_token)}




  private 
   def generate_token column
   	begin
   	  self[column] = SecureRandom.urlsafe_base64
   	end while User.exists?(column => self[column])
   end

end