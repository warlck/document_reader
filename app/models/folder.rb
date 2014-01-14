class Folder < ActiveRecord::Base
  acts_as_tree

  attr_accessible :name, :parent_id
  
  belongs_to :library
  has_many :documents, dependent: :destroy

  validates :name, presence: true

end
