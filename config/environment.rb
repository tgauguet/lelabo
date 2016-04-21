# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.asset_host = 'https://www.lelabo-ondemand.com'
ActionMailer::Base.default :content_type => "text/html"
ActionMailer::Base.smtp_settings = {
    :address => "smtp.sendgrid.net",
    :port => 587,
    :domain => "heroku.com",
    :authentication => :plain, 
    :user_name => "app48473619@heroku.com",
    :password => "korinq857908",
    :enable_starttls_auto => true,
    template_path: 'user_mailer'
}
