class SubscribeUserToMailingListJob < ActiveJob::Base
  queue_as :default

  def perform(user)
    gb = Gibbon::Request.new
    gb.lists.subscribe({:id => Rails.application.secrets.mailchimp_list_id, :email => {email: user.email}, :merge_vars => { :L_NAME => user.name, :F_NAME => user.firstname}, :double_optin => false})
  end
end
