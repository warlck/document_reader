FactoryGirl.define do
	factory :user do
		name "Foobar"
		email "foo@bar.com"
		password "foobar"
		password_confirmation "foobar"
	end
end