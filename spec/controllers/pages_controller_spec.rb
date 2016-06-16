require 'rails_helper'

RSpec.describe PagesController, type: :controller do

	#render help page
	it "expect to render the help page view" do
		expect( get: "/aide" ).to be_routable
	end

end
