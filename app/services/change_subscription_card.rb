class ChangeSubscriptionCard
	def self.call(subscription, token)
		begin
			user = subscription.user
			customer = Stripe::Customer.retrieve(user.stripe_customer_id)
			stripe_sub = customer.subscriptions.retrieve(subscription.stripe_id)

			stripe_sub.source = token
			stripe_sub.save!
		rescue Stripe::StripeError => e
			subscription.errors[:base] << e.message
		end
		subscription
	end 
end