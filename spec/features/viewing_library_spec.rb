require 'spec_helper'

feature 'User viewing his library' do
	let(:user) {create(:user)}
	let(:document) { create(:document, uploaded_file_file_size: 1024)}
	let(:folder) { create(:folder, name: "Documents")}
    let(:library ) { user.library }
    before(:each) { library.folders << folder }


	scenario 'sees Guest accounts library when not logged in' do
		visit library_path(library)
		expect(current_path).not_to eq library_path(library)
		expect(page).to have_content "Guest"
	end

	scenario 'can see documents listed and corresponding actions' do	
		library.documents << document
		log_in user
		visit library_path(library)
		expect(current_path).to eq library_path(library)
		expect(page).to have_content document.file_name
		expect(page).to have_css '.file_size', text: '1 KB'
		expect(page).to have_link "Upload", href: new_document_path
		expect(page).to have_link "Download", href: download_path(document)
		expect(page).to have_link "Delete", href: document_path(document)
	end

	scenario 'can see folders listed' do	
		log_in user
		visit library_path(library)
		expect(current_path).to eq library_path(library)
		expect(page).to have_link folder.name , href: browse_path(folder.id)
		expect(page).to have_link "Rename", href: rename_folder_path(folder)
		expect(page).to have_link "Delete", href: folder_path(folder)
	end

	scenario 'can create new folder' do
		log_in user
		visit library_path(library)
		expect(page).to have_link "New Folder", href: new_folder_path
		click_link "New Folder"
		fill_in "Name", with: "Articles"
		click_button "Create Folder"
		expect(page).to have_link "Articles"
		expect(current_path).to eq root_path
	end

	scenario "can browse into folder" do
        new_document = create(:document, :uploaded_file_file_name => "newdocument")
        folder.documents << new_document
		log_in user
		visit library_path(library)
		click_link folder.name
		expect(current_path).to eq browse_path(folder.id)
		expect(page).to have_content new_document.file_name
		expect(page).to have_link "Upload", href: new_sub_file_path(folder)
		expect(page).to have_link "New Folder",	 href: new_sub_folder_path(folder)
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

	scenario "can create file inside a folder", :slow do
		log_in user
		visit browse_path(folder)
		click_link "Upload"
		expect(current_path).to eq new_sub_file_path(folder)
		attach_file "document_uploaded_file", "#{Rails.root}/public/unix-programming.pdf"
	 	click_button "Upload"
	 	expect(current_path).to eq browse_path(folder)
	 	expect(page).to have_content "unix-programming"
	end


	scenario "can rename the folder"  do 
		log_in user
		visit library_path library
		click_link "Rename"
		expect(current_path).to eq rename_folder_path(folder)
		expect(page).to have_content "Rename"
		fill_in "Name", with: "Articles"
		click_button "Rename Folder"
		expect(current_path).to eq root_path
		expect(page).to have_link "Articles"
	end


end