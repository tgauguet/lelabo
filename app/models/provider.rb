class Provider < ActiveRecord::Base
	has_many :ingredients, through: :provider_prices
	has_many :provider_prices, dependent: :restrict_with_error
	belongs_to :user
	validates :name, presence: true
end
