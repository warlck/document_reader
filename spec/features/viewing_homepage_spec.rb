require 'spec_helper'

feature 'User viewing homepage' do
	scenario 'sees signup link' do
		visit root_path 
		expect(page).to have_link 'Sign Up'
		expect(page).to have_link 'Login'
	end
end