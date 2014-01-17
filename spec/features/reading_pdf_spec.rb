require 'spec_helper'

feature "User reading document" do
	let(:user) { create(:user)}
	let(:document) { create(:document)}
	before(:each) do 
		user.library.documents << document
		log_in user
	end
	scenario 'can see data attribure of pdf files' do
		expect(page).to have_link document.file_name, href: read_path(document)
	end

	scenario 'can open pdf file for reading', :slow, js:true do
		click_link document.file_name
		expect(current_path).to eq read_path(document)
		expect(page).to have_css '#tabs'
		expect(page).to have_css '.embed'
		expect(page).to have_css  '.gdocsviewer'
	end







end