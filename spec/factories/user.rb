FactoryGirl.define do
	factory :user do
		email "foo@bar.com"
		account_name "foo"
		name "Foo"
		firstname "Bar"
		password "Foobar42"
		password_confirmation "Foobar42"
		company "Foobar Factory"
		job_type "Foobarer"
		confirmed_at Date.today
	end
end