class Message < ActiveRecord::Base
  TEMP_EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates_format_of :email, with: TEMP_EMAIL_REGEX
end
