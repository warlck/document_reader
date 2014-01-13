class AddAttachmentToDocuments < ActiveRecord::Migration
  def change
  	add_attachment :documents, :uploaded_file
  end
end
