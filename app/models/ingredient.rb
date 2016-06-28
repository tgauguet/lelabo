class Ingredient < ActiveRecord::Base
	belongs_to :user
	validates :name, presence: true
	#code for sunspot solr
	#searchable do
	#		text :name, :stored => true
	#end
	before_validation :format_number

	def format_number
		# change the price from french to international in db
		self.price = price_before_type_cast.to_s.gsub(",", ".").to_f
	end

end
