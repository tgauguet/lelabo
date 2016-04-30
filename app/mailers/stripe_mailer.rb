class StripeMailer < ActionMailer::Base

	def expired_card_message(user)
		@user = current_user
	end

end