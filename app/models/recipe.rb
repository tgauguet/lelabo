class Recipe < ActiveRecord::Base
	belongs_to :user
	belongs_to :assembly
	has_many :ingredients
	has_many :steps
	validates_presence_of :name
end
