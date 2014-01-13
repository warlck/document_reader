class Document < ActiveRecord::Base
  belongs_to :library
  # attr_accessible :title, :body
end
