class SubscribeUserToMailingListJob < ActiveJob::Base
  queue_as :default

  def perform(user)
    begin
    	gb = Gibbon::Request.new
    	gb.lists(Rails.application.secrets.mailchimp_list_id).members.create(body: {email_address: user.email, status: "subscribed", merge_fields: {F_NAME: user.firstname}})
    rescue Gibbon::MailChimpError => e
    	logger.error "Mailchimp threw an error. The code is wrong with message: #{e.message}"
    end
  end
end

