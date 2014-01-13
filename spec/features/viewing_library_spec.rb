require 'spec_helper'

feature 'User viewing his library' do
	let(:user) {create(:user)}
	let(:document) { create(:document)}
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
		expect(page).to have_link "New document"
	end
end