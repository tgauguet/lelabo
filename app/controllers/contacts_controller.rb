#!/usr/bin/env ruby
# encoding: utf-8

class ContactsController < ApplicationController

	def new
		@contact = Contact.new
	end

	def create
		@contact = Contact.new(contact_params)
		if @contact
			ContactMailer.new_message(@contact).deliver_now
			redirect_to root_path
			flash[:notice] = "Votre message a bien été envoyé, nous vous répondrons aussi vite que possible"
		else
			redirect_to root_path
			flash[:error] = "Erreur lors de l'envoi du message"
		end
	end

	private

	def contact_params
		params.require(:contact).permit(:message,:email)
	end
end
