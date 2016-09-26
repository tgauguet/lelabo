class Provider < ActiveRecord::Base
	has_many :ingredients
	belongs_to :user
	validates :name, presence: true
end
