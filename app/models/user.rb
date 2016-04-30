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
    has_one :subscription, dependent: :destroy
    validates :account_name, uniqueness: true, presence: true, on: :set_names
    has_attached_file :avatar, {
                                    :styles => { medium: "300x300#", small: "75x75#"},
                                    :default_url => "/avatar/missing/missing.jpg",
                                    :size => { :in => 0..300.kilobytes }
                                }
    validates_attachment_content_type :avatar, 
                                    :content_type => /^image\/(png|gif|jpeg)/

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

end
