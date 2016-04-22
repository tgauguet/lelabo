class User < ActiveRecord::Base
	TEMP_EMAIL_PREFIX = 'change@me'
    TEMP_EMAIL_REGEX = /\Achange@me/
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable
	after_create :welcome_email
	validates_format_of :email, without: TEMP_EMAIL_REGEX, on: :update

    def password_required?
        super if confirmed?
    end

    def password_match?
        self.errors[:password] << "can't be blank" if password.blank?
        self.errors[:password_confirmation] << "can't be blank" if password_confirmation.blank?
        self.errors[:password_confirmation] << "does not match password" if password != password_confirmation
        password == password_confirmation && !password.blank?
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
