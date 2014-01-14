require 'spec_helper'

feature 'User creating document by uploading pdf' do
	let(:user) { create(:user)}	
	 scenario 'is successful when  valid file is used' do
	 	log_in user
	 	visit new_document_path 
	 	expect(page).to have_content "Upload Document"
	 	attach_file "File", "#{Rails.root}/public/unix-programming.pdf"
	 	click_button "Upload"
	 	expect(current_path).to eq library_path user.library
	 	expect(page).to have_css 'tr.document'
	 	expect(page).to have_content "unix-programming"
	 	click_link 'Download'
	 	expect(page.response_headers['Content-Type']).to eq 'application/pdf'
	 end

	
end