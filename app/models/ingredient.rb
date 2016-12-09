class Ingredient < ActiveRecord::Base
	belongs_to :user
	has_paper_trail
	has_many :quantities, dependent: :restrict_with_error
	has_many :provider_prices, dependent: :destroy
	has_many :providers, through: :provider_prices
	has_many :recipes, through: :quantities
	accepts_nested_attributes_for :provider_prices, allow_destroy: true
	#code for sunspot solr
	#searchable do
	#		text :name, :stored => true
	#end
	before_validation :format_number
	before_save :default_value
	validates :name, :presence => { :message => 'Le nom ne peux pas etre vide' }

	def cocoa_percent=(val)
		self['cocoa_percent'] = val.to_s.include?(",") ? val.sub!(',', '.').to_f : val
	end

	def cocoa_butter_percent=(val)
		self['cocoa_butter_percent'] = val.to_s.include?(",") ? val.sub!(',', '.').to_f : val
	end	

	def sugar_percent=(val)
		self['sugar_percent'] = val.to_s.include?(",") ? val.sub!(',', '.').to_f : val
	end	

	def water_percent=(val)
		self['water_percent'] = val.to_s.include?(",") ? val.sub!(',', '.').to_f : val
	end	

	def fat_percent=(val)
		self['fat_percent'] = val.to_s.include?(",") ? val.sub!(',', '.').to_f : val
	end	

	def alcool_percent=(val)
		self['alcool_percent'] = val.to_s.include?(",") ? val.sub!(',', '.').to_f : val
	end	

	def dry_matter_percent=(val)
		self['dry_matter_percent'] = val.to_s.include?(",") ? val.sub!(',', '.').to_f : val
	end	

	def cocoa_total_percent=(val)
		self['cocoa_total_percent'] = val.to_s.include?(",") ? val.sub!(',', '.').to_f : val
	end	

	def stabilizer=(val)
		self['stabilizer'] = val.to_s.include?(",") ? val.sub!(',', '.').to_f : val
	end	

	def default_value
		# set the value at 0 if null
		self.cocoa_percent = 0 unless self.cocoa_percent
		self.protein = 0 unless self.protein
		self.carbohydrates = 0 unless self.carbohydrates
		self.sugar_power = 0 unless self.sugar_power
		self.kcal = 0 unless self.kcal
		self.sugar_percent = 0 unless self.sugar_percent
		self.water_percent = 0 unless self.water_percent
		self.fat_percent = 0 unless self.fat_percent
		self.alcool_percent = 0 unless self.alcool_percent
		self.dry_matter_percent = 0 unless self.dry_matter_percent
		self.cocoa_butter_percent = 0 unless self.cocoa_butter_percent
		self.cocoa_total_percent = 0 unless self.cocoa_total_percent
		self.stabilizer = 0 unless self.stabilizer
	end

	def format_number
		# change the price from french to international in db
		self.price = price_before_type_cast.to_s.gsub(",", ".").to_f
	end

	def name_humanized
		"#{self.name.humanize}"
	end

end
