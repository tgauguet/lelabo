class ContactMailer < ActionMailer::Base

	def new_message(contact)
		@contact = contact
		mail( to: "timogauguet@wanadoo.fr", subject: "nouveau message sur Sweetkit", from: @contact.email )
	end

end
