class Library < ActiveRecord::Base
  belongs_to :user, touch: true
  has_many :documents, dependent: :destroy
  has_many :folders, dependent: :destroy
end
