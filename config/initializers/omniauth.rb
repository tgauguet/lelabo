OmniAuth.config.logger = Rails.logger
#Rails.application.config.middleware.use OmniAuth::Builder do
#    provider :facebook, 'FACEBOOK_KEY', 'FACEBOOK_SECRET',
#    :display => 'popup'
#end

#Rails.application.config.middleware.use OmniAuth::Builder do
#    provider :stripe_connect, ENV['STRIPE_CONNECT_CLIENT_ID'], ENV['stripe_secret_key']
#end