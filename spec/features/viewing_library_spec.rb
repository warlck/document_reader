require 'spec_helper'

feature 'User viewing his library' do
	let(:user) {create(:user)}
	let(:document) { create(:document, uploaded_file_file_size: 1024)}
	let(:folder) { create(:folder, name: "Documents")}
    let(:library ) { user.library }
    before(:each) { library.folders << folder }


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
		log_in user
		visit library_path(library)
		expect(current_path).to eq library_path(library)
		expect(page).to have_link folder.name , href: browse_path(folder.id)
	end

	scenario "can browse into folder" do
        new_document = create(:document, :uploaded_file_file_name => "newdocument")
        folder.documents << new_document
		log_in user
		visit library_path(library)
		click_link folder.name
		expect(current_path).to eq browse_path(folder.id)
		expect(page).to have_content new_document.file_name
		expect(page).to have_link "New Folder", href: new_sub_folder_path(folder)
		visit library_path(library)
		expect(page).not_to have_content new_document.file_name
	end

	scenario "can create sub folder" do
		log_in user
		visit browse_path(folder)
		click_link "New Folder"
		expect(current_path).to eq new_sub_folder_path(folder)
		expect(page).to have_link "Back to", href: browse_path(folder)
		fill_in "Name", with: "Books"
		click_button "Create Folder"
		expect(folder.children).not_to be_empty
		expect(current_path).to eq browse_path(folder)
	end






	
end