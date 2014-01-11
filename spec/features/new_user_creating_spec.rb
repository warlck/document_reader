require 'spec_helper'

feature	"Creating new user" do
   scenario 'successfully given valid attributes' do
   	  visit signup_path
   	  expect(page).to have_content 'New User Registration'

   end

end