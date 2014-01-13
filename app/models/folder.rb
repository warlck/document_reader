class Folder < ActiveRecord::Base
  belongs_to :library
  attr_accessible :name, :parent_id

  has_many :documents

end
