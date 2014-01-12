require 'spec_helper'

feature "User logging in" do
	let(:user) { create(:user)}
	scenario "successfully, provided valid authentication values" do
        visit login_path
        expect(page).to have_content "Log In"
        log_in user
        expect(current_path).to eq root_path
        expect(page).to have_content user.name 
	end

	scenario "unsuccessfully ,  provided invalid email " do
        login_as user.email, "incorrect"  
        expect(page).to have_css 'div#flash_alert', text: "Email or password is invalid"
    end

    scenario "unsuccessfully ,  provided invalid email " do
        login_as "non@existing.com", user.password  
        expect(page).to have_css 'div#flash_alert', text: "Email or password is invalid"
    end


    scenario 'logs out successfully' do
        log_in user 
        expect(page).to have_content 'Logout'
        click_link 'Logout'
        expect(current_path).to eq root_path
        expect(page).to have_content 'Login'
    end

    scenario "successfully, provided valid authentication values and remember me" do
        visit login_path
        expect(page).to have_content "Remember me"
        fill_in "Email", with: user.email
        fill_in "Password", with: user.password
        check 'Remember me'
        click_button 'Log In'
        expect(current_path).to eq root_path
        expect(page).to have_content user.name 
    end


end