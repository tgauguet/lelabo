#!/usr/bin/env ruby
# encoding: utf-8

class User < ActiveRecord::Base
		has_paper_trail
		TEMP_EMAIL_PREFIX = 'change@me'
    TEMP_EMAIL_REGEX = /\Achange@me/
		# Include default devise modules. Others available are:
		# :confirmable, :lockable, :timeoutable and :omniauthable
		devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable
		#before_save :after_confirmation
		validates_format_of :email, without: TEMP_EMAIL_REGEX, on: :update
    has_many :feedbacks, dependent: :destroy
		has_many :categories, dependent: :destroy
    has_many :to_do_lists, dependent: :destroy
    has_many :providers, dependent: :destroy
		has_many :votes, dependent: :destroy
		has_many :voted_recipes, :through => :votes, :source => :recipe
    has_many :recipes, dependent: :destroy
		has_many :staffs, dependent: :destroy
    has_many :ingredients, dependent: :destroy
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
        UserMailer.welcome_email(self).deliver_now #delay
    end

		def pro_user?
			self.trial_expired? || (self.subscription && self.subscription.plan.name == "PRO")
		end

		def business_user?
			self.trial_expired? || ((self.subscription && self.subscription.plan && self.subscription.plan.name == "ENTREPRISE") || self.email == "julien.merceron1@gmail.com" || self.email == "severine.faure4@wanadoo.fr" || self.email == "timothee.gauguet@orange.fr")
		end

		def basic_user?
			(self.subscription.nil? || (self.subscription && self.subscription.plan && self.subscription.plan.name == "BASIC") unless self.business_user?) && self.trial_expired?
		end

		def remaining_days
	   ((self.created_at + 30.days).to_date - Date.today).round
	  end

		def trial_expired?
	   	self.remaining_days <= 0 ? false : true
	  end

end
