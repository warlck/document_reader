require 'spec_helper'

feature 'User viewing his library' do
	let(:user) {create(:user)}
	let(:document) { create(:document, uploaded_file_file_size: 1024)}
	let(:folder) { create(:folder, name: "Documents")}
    let(:library ) { user.library }


	scenario 'is redirected to login page if not signed in' do
		visit library_path(library)
		expect(current_path).to eq login_path
		expect(page).to have_content 'You are not '
	end

	scenario 'can see documents listed' do	
		library.documents << document
		log_in user
		visit library_path(library)
		expect(current_path).to eq library_path(library)
		expect(page).to have_content document.file_name
		expect(page).to have_css '.file_size', text: '1 KB'
		expect(page).to have_link "Upload", href: new_document_path

	end

	scenario 'can see folders listed' do	
		library.folders << folder
		log_in user
		visit library_path(library)
		expect(current_path).to eq library_path(library)
		expect(page).to have_content folder.name
	end

	
end