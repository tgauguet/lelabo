class Ingredient < ActiveRecord::Base
	belongs_to :user
	validates :name, presence: true
	has_many :quantities
	has_many :provider_prices, dependent: :destroy
	has_many :providers, through: :provider_prices
	has_many :recipe, through: :quantities
	accepts_nested_attributes_for :provider_prices, allow_destroy: true
	#code for sunspot solr
	#searchable do
	#		text :name, :stored => true
	#end
	before_validation :format_number
	before_save :default_value

	def default_value
		# set the value at 0 if null
		self.cocoa_percent = cocoa_percent ||= 0
		self.sugar_power = sugar_power ||= 0
		self.kcal = kcal ||= 0
		self.sugar_percent = sugar_percent ||= 0
		self.water_percent = water_percent ||= 0
		self.fat_percent = fat_percent ||= 0
		self.alcool_percent = alcool_percent ||= 0
		self.dry_matter_percent = dry_matter_percent ||= 0
		self.cocoa_butter_percent = cocoa_butter_percent ||= 0
		self.cocoa_total_percent = cocoa_total_percent ||= 0
	end

	def format_number
		# change the price from french to international in db
		self.price = price_before_type_cast.to_s.gsub(",", ".").to_f
	end

	def name_humanized
		"#{self.name.humanize}"
	end

end
