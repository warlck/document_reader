require 'spec_helper'

feature	"Creating new user" do
	before(:each) { visit signup_path}
   scenario 'successfully given valid attributes' do
   	  expect(page).to have_content 'New User Registration'
   	  fill_in "Name", with: "Foo"
   	  fill_in "Email", with: "foo@bar.com"
   	  fill_in "Password", with: "foobar"
   	  fill_in "Password confirmation", with: "foobar"
   	  click_button 'Submit'
   	  expect(page).to have_content 'Successfully registered'

   end

   scenario "unsuccessfully  given invalid password confirmation" do
  	 fill_in "Name", with: "Meebar"
 	 fill_in "Email", with: "me@example.com"
	 fill_in "Password", with: "foobar"
	 click_button "Submit"
	 expect(page).to have_content "Password doesn't match confirmation"
	 expect(page).to have_content "New User Registration"
   end

   scenario "unsuccessfully given invalid email" do
		fill_in "Name", with: "Meebar"
		fill_in "Email", with: ""
		fill_in "Password", with: "foobar"
		fill_in "Password confirmation", with: "foobar"
		click_button "Submit"
		expect(page).to have_content "Email can't be blank"
   end

   scenario "unsuccessfully  given empty	password " do
		fill_in "Name", with: "Meebar"
		fill_in "Email", with: "me@example.com"
		fill_in "Password confirmation", with: "foobar"
		click_button "Submit"
		expect(page).to have_content "Password doesn't match confirmation"
		expect(page).to have_content "New User Registration"
	end


	scenario "unsuccessfully  given empty	name " do
		fill_in "Email", with: "me@example.com"
		fill_in "Password", with: "foobar"
		fill_in "Password confirmation", with: "foobar"
		click_button "Submit"
		expect(page).to have_content "Name can't be blank"
		expect(page).to have_content "New User Registration"
	end

	scenario "unsuccessfully  given  non-unique email " do
		user = create(:user, email: "foo@bar.com")
		fill_in "Name", with: "Foobar"
		fill_in "Email", with: "foo@bar.com"
		fill_in "Password", with: "foobar"
		fill_in "Password confirmation", with: "foobar"
		click_button "Submit"
		expect(page).to have_content "has already been taken"
		expect(page).to have_content "New User Registration"
	end

end