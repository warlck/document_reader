class Document < ActiveRecord::Base
  attr_accessible :uploaded_file
  belongs_to :library
  belongs_to :folder

  has_attached_file :uploaded_file
  validates_attachment :uploaded_file, :presence => true,
  :content_type => { :content_type => "application/pdf" },
  :size => { :in => 0..10.megabytes }
end
