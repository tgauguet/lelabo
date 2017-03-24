#!/usr/env/bin ruby
#encoding: utf-8

class Recipe < ActiveRecord::Base
	belongs_to :user
	has_paper_trail
	is_impressionable
	has_many :images, dependent: :destroy
	has_many :ingredients, through: :quantity
	has_many :recipes, through: :sub_recipe
	has_one :recipe_category
	has_many :sub_recipes, dependent: :destroy
	has_many :totals, dependent: :destroy
	has_many :quantities, dependent: :destroy
	has_many :votes, dependent: :destroy
	has_many :voting_users, through: :votes, source: :user
	validates_length_of :images, maximum: 8
	accepts_nested_attributes_for :totals, allow_destroy: true
	accepts_nested_attributes_for :images, allow_destroy: true
	accepts_nested_attributes_for :sub_recipes, reject_if: :reject_recipe, allow_destroy: true
	accepts_nested_attributes_for :quantities, reject_if: :reject_quantity, allow_destroy: true
	validates_presence_of :name
	before_save :default_values
	has_attached_file :image, {
                                    :styles => { medium: "500x500#", small: "75x75#"},
                                    :size => { :in => 0..300.kilobytes },
																		:default_url => "/images/missing-cake.png"
                                }
  validates_attachment_content_type :image,
                                    :content_type => /^image\/(png|gif|jpeg)/

	def total_votes
		upvote - downvote
	end

	def upvote
		self.votes.where(up: 1).all.count
	end

	def downvote
		self.votes.where(up: 0).all.count
	end

	def reject_quantity(attribute)
		attribute['ingredient_id'].blank?
	end

	def reject_recipe(attribute)
		attribute['sub_id'].blank? || attribute["weight"].blank?
	end

	def has_vat?
		if self.vat?
			false
		else
			true
		end
	end

	def portion_price=(val)
		self['portion_price'] = val.to_s.include?(",") ? val.sub!(',', '.').to_f : val
	end

	def coef=(val)
		self['coef'] = val.to_s.include?(",") ? val.sub!(',', '.').to_f : val
	end

	def default_values
		self.to_produce = 100 unless self.to_produce
		self.portion_weight = 100 unless self.portion_weight
		self.eq_data = "Ganache" unless self.eq_data
		self.cost_data = 100 unless self.cost_data
		self.portion = 100 unless self.portion
		self.array_unit = "g" unless self.array_unit
		self.unit = "grammes" unless self.unit
		self.coef = 4 unless self.coef
		self.vat = 10 unless self.vat
	end

	# sum of all quantities weights in grammes !!!CHECKED!!!
	def recipe_weight
		weight = self.quantities.collect { |q| q.quantity_weight }.sum
		weight + self.sub_recipes.collect { |s| s.weight }.sum
	end

	def percentage_of(matter)
		matter_weight = self.quantities.collect { |q| (q.ingredient.send(matter) * q.weight) }.sum
		rec_weight = matter_weight + self.sub_recipes.collect { |s| (s.current_recipe.quantities.collect { |q| (q.ingredient.send(matter) * q.weight) }.sum / s.current_recipe.recipe_weight) * s.weight }.sum
		rec_weight = rec_weight / self.recipe_weight unless recipe_weight == 0
	end

	def compo
		self.quantities.all.order("weight DESC")
	end

	def milk_of(matter)
		milks = self.quantities.joins(:ingredient).where(ingredients: { category: "Produits laitiers" })
		milkies = self.sub_recipes { |s| s.current_recipe.quantities.joins(:ingredient).where(ingredients: { category: "Produits laitiers" }) }
		matter_weight = milks.collect { |q| q.ingredient.send(matter) * q.weight}.sum + milkies.collect { |s| s.current_recipe.quantities.collect { |q| q.ingredient.send(matter) * q.weight}.sum }.sum
		matter_weight / recipe_weight unless recipe_weight == 0
	end

	def pulp_percentage
		pulps = self.quantities.joins(:ingredient).where(ingredients: { is_pulp: 1 })
		pulpies = self.sub_recipes { |s| s.current_recipe.quantities.joins(:ingredient).where(ingredients: { is_pulp: 1 }) }
		total = pulps.collect { |q| q.weight }.sum + pulpies.collect { |s| s.current_recipe.quantities.collect { |q| q.weight }.sum }.sum
		total * 100 / recipe_weight unless recipe_weight == 0
	end

	def milk_and_est(recipe)
    self.milk_of("fat_percent") + self.milk_of("dry_matter_percent")
  end

	def for_100_gram(value)
		total = self.sub_recipes.collect { |s| ( s.current_recipe.quantities.collect { |q| (q.ingredient.send(value) * q.weight) }.sum) }.sum
		total = total + self.quantities.collect { |q| (q.ingredient.send(value) * q.quantity_weight) }.sum
		total / recipe_weight  unless recipe_weight == 0
	end

	def to_produce_in_grammes
		self.to_produce *
		if self.unit == "parts"
			 self.portion_weight
		elsif self.unit == "#{self.portion_name}"
			self.portion.to_i
		elsif self.unit == "recettes"
			(self.totals.first.value * 1000).to_i
		elsif self.unit == "kilogrammes"
			1000
		else
			1
		end
	end

	def prht
		self.total_cost * self.to_produce_in_grammes / self.recipe_weight
	end

	def pvht
		self.prht * self.coef
	end

	def vat_price
		self.pvht * self.vat / 100
	end

	def pvttc
		self.pvht + self.vat_price
	end

	def show_total(matter)
		self.quantities.collect { |q| q.send(matter) }.sum
	end

	def total_cost
		total = self.quantities.collect { |q| q.ingredient.price * q.quantity_weight }.sum / 1000
		total = total + self.sub_recipes.collect { |s| s.current_recipe.kilo_cost * s.weight }.sum / 1000
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

	def cunsumption_date
		if !self.production_date.blank? && self.consumption_days
			date = DateTime.parse(self.production_date) + self.consumption_days.days
			date.strftime("%d/%m/%Y")
		else
			""
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
