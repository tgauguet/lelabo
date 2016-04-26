class SubscriptionsController < ApplicationController
	skip_before_filter :authenticate_user!
	before_filter :load_plans

	def index
	end

	def new
		@subscription = Subscription.new
		@user = current_user
		@plan = Plan.find(params[:plan_id])
	end

	def create
		@plan = Plan.find(params[:plan_id])
		@user = current_user
		@subscription = CreateSubscription.call(
			@plan,
			params[:email_address],
			params[:stripe_token]
		)
		if @subscription.errors.blank?
			flash[:notice] = "Merci pour votre abonnement."
			redirect_to root_path
		else
			render :new
		end
	end

	protected

	def load_plans
		@plans = Plan.where(published: true).order("amount")
	end
end
