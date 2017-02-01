#!/usr/bin/env ruby
#encoding: utf-8

class SubscriptionsController < ApplicationController
	skip_before_filter :authenticate_user!
	before_filter :load_plans
	before_action :set_paper_trail_whodunnit

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
		if !@user.stripe_customer_id?
			@subscription = CreateSubscription.call(
				@plan,
				params[:email_address],
				params[:stripe_token]
			)
			if @subscription.errors.blank?
				flash[:notice] = "Félicitations, vous êtes désormais abonné à l'offre #{@plan.name}"
				redirect_to root_path
				UserMailer.subscription_email(@user).deliver_now #delay
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
				flash[:notice] = "Félicitations, vous êtes désormais abonné à l'offre #{@plan.name}"
			rescue Stripe::StripeError => e
				from_subscription.errors[:base] << e.message
				flash[:error] = "Une erreur a empêché le changement de votre formule d'abonnement"
			end
			redirect_to root_path
		end
	end

	protected

	def load_plans
		@plans = Plan.where(published: true).order("amount ASC")
	end
end
