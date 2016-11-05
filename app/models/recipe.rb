#!/usr/env/bin ruby
#encoding: utf-8

class Recipe < ActiveRecord::Base
	belongs_to :user
	has_many :images, dependent: :destroy
	has_many :ingredients, through: :quantity
	has_many :recipe_items, dependent: :restrict_with_error
	has_many :totals, dependent: :destroy
	has_many :quantities, dependent: :destroy
	accepts_nested_attributes_for :totals, allow_destroy: true
	accepts_nested_attributes_for :images, allow_destroy: true
	accepts_nested_attributes_for :quantities, reject_if: :reject_quantity, allow_destroy: true
	validates_presence_of :name
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

end
