#!/usr/env/bin ruby
#encoding: utf-8

class Recipe < ActiveRecord::Base
	belongs_to :user
	has_paper_trail
	has_many :images, dependent: :destroy
	has_many :ingredients, through: :quantity
	has_many :recipe_items, dependent: :restrict_with_error
	has_many :totals, dependent: :destroy
	has_many :quantities, dependent: :destroy
	validates_length_of :images, maximum: 8
	accepts_nested_attributes_for :totals, allow_destroy: true
	accepts_nested_attributes_for :images, allow_destroy: true
	accepts_nested_attributes_for :quantities, reject_if: :reject_quantity, allow_destroy: true
	validates_presence_of :name
	before_save :default_values
	has_attached_file :image, {
                                    :styles => { medium: "300x300#", small: "75x75#"},
                                    :size => { :in => 0..300.kilobytes },
																		:default_url => "/images/missing-cake.png"
                                }
  validates_attachment_content_type :image,
                                    :content_type => /^image\/(png|gif|jpeg)/

	def reject_quantity(attribute)
		attribute['ingredient_id'].blank?
	end

	def portion_price=(val)
		self['portion_price'] = val.to_s.include?(",") ? val.sub!(',', '.').to_f : val
	end	

	def default_values
		self.vat = 5.5 unless self.vat
		self.unit = "grammes" unless self.unit
		self.to_produce = 100 unless self.to_produce
		self.portion_weight = 100 unless self.portion_weight
		self.portion = 100 unless self.portion
	end

	def percentage_of(matter)
		matter_weight = self.quantities.collect { |q| (q.ingredient.send(matter) * q.weight) }.sum
		matter_weight / recipe_weight unless recipe_weight == 0
	end

	def milk_of(matter)
		milks = self.quantities.joins(:ingredient).where(ingredients: { category: "Produits laitiers" })
		matter_weight = milks.collect { |q| q.ingredient.send(matter) * q.weight}.sum
		matter_weight / recipe_weight unless recipe_weight == 0
	end

	def sum_of_kcal
		total = self.quantities.collect { |q| q.ingredient.kcal }.sum
		total / recipe_weight unless recipe_weight == 0
	end

	def pulp_percentage
		pulps = self.quantities.joins(:ingredient).where(ingredients: { is_pulp: 1 })
		total = pulps.collect { |q| q.weight }.sum
		total * 100 / recipe_weight unless recipe_weight == 0
	end

	def milk_and_est(recipe)
    self.milk_of("fat_percent") + self.milk_of("dry_matter_percent")
  end

	def show_total(matter)
		self.quantities.collect { |q| q.send(matter) }.sum
	end

	def recipe_weight
		self.quantities.collect { |q| q.weight }.sum
	end

	def total_cost
		self.quantities.collect { |q| q.ingredient.price * q.weight }.sum / 1000
	end

	def kilo_cost
		total_cost / recipe_weight * 1000 unless recipe_weight == 0
	end

	def custom_cost
		self.kilo_cost * self.totals.first.value unless recipe_weight == 0
	end

	def to_product
		if self.fast?
			self.to_produce
		else
			if self.stock? && self.sold?
				production = self.sold - self.stock
				production >= 0 ? production : "0"
			elsif !self.stock? && self.sold?
				self.sold
			else
				"0"
			end
		end
	end

	def to_details
		if self.unit == "parts"
			self.portion_weight? ? "de " + self.portion_weight.to_s + " g" : "de ? g"
		elsif self.unit == "recettes"
			self.totals.first.value? ? "de " + (self.totals.first.value * 1000).to_i.to_s + " g" : "de ? g"
		elsif self.unit == "#{self.portion_name}"
			self.portion? ? "de " + self.portion + " g" : "de ? g"
		else
			" "
		end
	end

	def personnalized
		self.portion_name? ? self.portion_name : "portions"
	end

end
