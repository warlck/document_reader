module SignupHelpers
	def sign_up
	  visit signup_path
	  fill_in "Name", with: "Foo"
   	  fill_in "Email", with: "foo@bar.com"
   	  fill_in "Password", with: "foobar"
   	  fill_in "Password confirmation", with: "foobar"
   	  click_button 'Submit'
	end

end

RSpec.configure do |config|
	config.include SignupHelpers
end