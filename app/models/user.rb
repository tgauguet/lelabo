class User < ActiveRecord::Base
	TEMP_EMAIL_PREFIX = 'change@me'
    TEMP_EMAIL_REGEX = /\Achange@me/
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :confirmable,  omniauth_providers: [:facebook, :instagram]
	after_create :welcome_email
	validates_format_of :email, without: TEMP_EMAIL_REGEX, on: :update

	def self.find_for_oauth(auth, signed_in_resource = nil)
        identity = Identity.find_for_oauth(auth)
        user = signed_in_resource ? signed_in_resource : identity.user
        if user.nil?
            email_is_verified = auth.info.email && (auth.info.verified || auth.info.verified_email)
            email = auth.info.email if email_is_verified
            user = User.where(:email => email).first if email
            if user.nil?
            user = User.new(
            name: auth.extra.raw_info.name,
            #username: auth.info.nickname || auth.uid,
            email: email ? email : "#{TEMP_EMAIL_PREFIX}-#{auth.uid}-#{auth.provider}.com",
            password: Devise.friendly_token[0,20]
            )
            user.save!
        end
    end

    if identity.user != user
        identity.user = user
        identity.save!
    end
    user
    end

    def welcome_email
        if self.email && self.oauthdelivered?
            UserMailer.welcome_email(self).deliver_now
        end
    end

    def email_verified?
        self.email && self.email !~ TEMP_EMAIL_REGEX
    end

    # instead of deleting, indicate the user requested a delete & timestamp it
    def soft_delete
        update_attribute(:deleted_at, Time.current)
    end

    # ensure user account is active
    #def active_for_authentication?
    #	super && !deleted_at
    #end

    # provide a custom message for a deleted account
    #def inactive_message
    #    !deleted_at ? super : :deleted_account
    #end

end
