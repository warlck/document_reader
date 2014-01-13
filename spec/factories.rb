FactoryGirl.define do
	factory :user do
		name "Foobar"
		email "foo@bar.com"
		password "foobar"
		password_confirmation "foobar"
	end

	factory :document do
		uploaded_file_file_name "unix-programming.pdf"
		uploaded_file_content_type "application/pdf"
		uploaded_file_file_size "140000"
	end
end