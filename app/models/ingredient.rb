class Ingredient < ActiveRecord::Base
	belongs_to :user
	has_one :ingredient_category, dependent: :destroy
	validates :name, presence: true
	accepts_nested_attributes_for :ingredient_category, allow_destroy: true
	searchable do
		text :name, :stored => true
	end
	before_validation :format_number

	def format_number
		# change the price from french to international in db
		self.price = price_before_type_cast.to_s.gsub(",", ".").to_f
	end

end
