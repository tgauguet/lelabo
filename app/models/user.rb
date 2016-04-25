#!/usr/bin/env ruby
# encoding: utf-8

class User < ActiveRecord::Base
	TEMP_EMAIL_PREFIX = 'change@me'
    TEMP_EMAIL_REGEX = /\Achange@me/
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable
	#before_save :after_confirmation
	validates_format_of :email, without: TEMP_EMAIL_REGEX, on: :update
    has_many :feedbacks, dependent: :destroy
    has_attached_file :avatar
    validates_attachment :avatar, :size => { :in => 0..300.kilobytes }
    validates_attachment :avatar, :content_type => { :content_type => "image/jpg", :content_type => "image/png" }, :default_url => "/avatar/missing/missing.jpg"

    def password_required?
        super if confirmed?
    end

    def password_match?
        self.errors[:password] << "ne peux pas être vide" if password.blank?
        self.errors[:password_confirmation] << "ne peux pas être vide" if password_confirmation.blank?
        self.errors[:password_confirmation] << "n'est pas identique au mot de passe" if password != password_confirmation
        password == password_confirmation && !password.blank?
    end

    def after_confirmation
        UserMailer.welcome_email(self).deliver_now
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
