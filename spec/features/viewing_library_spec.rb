require 'spec_helper'

feature 'User viewing his library' do
	let!(:user) {create(:user)}
	let!(:document) { create(:document)}
	let!(:library) { user.library.documents << document}

	scenario 'is redirected to login page if not signed in' do
		visit library_path(library)
		expect(page).to have_content  document.file_name


	end
end