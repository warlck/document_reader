class Folder < ActiveRecord::Base
  acts_as_tree

  attr_accessible :name, :parent_id
  
  belongs_to :library, touch: true
  has_many :documents, dependent: :destroy

  validates :name, presence: true

end
