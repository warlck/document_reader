class Library < ActiveRecord::Base
  belongs_to :user
  has_many :documents, dependent: :destroy
end