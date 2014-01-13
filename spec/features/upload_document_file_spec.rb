require 'spec_helper'

feature 'User creating document by uploading pdf' do
	 scenario 'is successful when  valid file is used' do
	 	visit new_document_path 
	 	expect(page).to have_content "Upload Document"
	 	attach_file "File", "#{Rails.root}/public/unix-programming.pdf"
	 	click_button "Upload"
	 	expect(current_path).to eq documents_path
	 	expect(page).to have_css 'tr.document'
	 	expect(page).to have_content "unix-programming"
	 end
end