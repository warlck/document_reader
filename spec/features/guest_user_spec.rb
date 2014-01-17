require 'spec_helper'

feature 'Guest user' do
	scenario 'should be defined if no user is logged in' do
		visit root_path
		expect(page).to have_link 'Guest'
	end

	scenario 'can see its documents and folders' do
		visit root_path
		expect(page).to have_link 'Upload'
		expect(page).to have_link "New Folder"
		create_folder "Documents"
		expect(current_path).to eq root_path
		expect(page).to have_content 'Documents'
	end

	scenario 'can transfer all files and folders to signed up user', :slow do
		 visit root_path
         create_folder "Documents"
         upload_file
         sign_up
         expect(page).to have_link "Documents"
         expect(page).to have_link "Download"
         save_and_open_page
	end

end


def create_folder name
	click_link "New Folder"
	fill_in "Name", with: name
	click_button "Create Folder"
end

