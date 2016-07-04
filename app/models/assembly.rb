class Assembly < ActiveRecord::Base
	has_many :recipes
	belongs_to :user
end
