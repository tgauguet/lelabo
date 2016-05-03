#!/usr/bin/env ruby
#encoding: utf-8

class SubscriptionsController < ApplicationController
	skip_before_filter :authenticate_user!
	before_filter :load_plans

	def index
		@user = current_user
	end

	def new
		@subscription = Subscription.new
		@user = current_user
		@plan = Plan.find(params[:plan_id])
	end

	def create
		@user = current_user
		@plan = Plan.find(params[:plan_id])
		if @user.stripe_customer_id.blank?
			@subscription = CreateSubscription.call(
				@plan,
				params[:email_address],
				params[:stripe_token]
			)
			if @subscription.errors.blank?
				flash[:notice] = "Merci, vous êtes désormais abonné à l'offre #{@plan.name}"
				redirect_to root_path
			else
				render :new
				flash[:error] = "Une erreur a eu lieu lors de la création de votre abonnement, merci de réessayer"
			end
		else
			from_subscription = @user.subscription
			begin
				@customer = Stripe::Customer.retrieve(@user.stripe_customer_id)
				subscription = @customer.subscriptions.retrieve(
				          from_subscription.stripe_id
				       	)
				subscription.plan = @plan.stripe_id
				subscription.save
				from_subscription.plan = @plan
				from_subscription.save
			rescue Stripe::StripeError => e
				from_subscription.errors[:base] << e.message
			end
			redirect_to root_path
		end
	end

	protected

	def load_plans
		@plans = Plan.where(published: true).order("price")
	end
end
