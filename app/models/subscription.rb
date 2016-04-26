class Subscription < ActiveRecord::Base
	has_paper_trail
	belongs_to :user
	belongs_to :plan
end
