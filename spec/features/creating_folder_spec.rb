require 'spec_helper'

feature "User creating folder"  do
    let(:user) {create(:user)}
	scenario "can access new folder path when not logged in" do
		visit new_folder_path
		expect(current_path).to eq new_folder_path
		expect(page).to have_content "New Folder"
	end

	scenario "succesfully creates folder when logged in" do
		log_in user
		visit new_folder_path
		expect(page).to have_content "New Folder"
		fill_in "Name", with: "Documents"
		click_button "Create Folder"
		expect(user.folders.count).to eq 1
	end

	scenario "can not create folder when name is not provided" do
		log_in user
		visit new_folder_path
		click_button "Create Folder"
		expect(page).to have_content "Name can't be blank"
		expect(user.folders.count).to eq 0
	end



end