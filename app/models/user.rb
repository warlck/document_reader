class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation
  has_one :library, dependent: :destroy
  has_many :documents, through: :library
  has_many :folders, through: :library 

  validates_presence_of :name, :email, :password_digest, unless: :guest?
  validates_uniqueness_of :email, allow_blank: true
  validates_confirmation_of :password

  # override has_secure_password to customize validation until Rails 4.
  require 'bcrypt'
  attr_reader :password
  include ActiveModel::SecurePassword::InstanceMethodsOnActivation

  before_create { generate_token(:auth_token)}
  after_create { self.library = Library.create }
  
  def send_password_reset
  	generate_token(:password_reset_token)
  	self.password_reset_sent_at = Time.zone.now
  	save!
  	UserMailer.password_reset(self).deliver
  end

  def self.new_guest
    create {|u| u.guest = true}
  end

  def move_to user
    library.update_attribute(:user_id, user.id )
    user.library.destroy
    self.delete
  end



  private 
   def generate_token column
   	begin
   	  self[column] = SecureRandom.urlsafe_base64
   	end while User.exists?(column => self[column])
   end

end
