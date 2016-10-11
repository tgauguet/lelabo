class Recipe < ActiveRecord::Base
	belongs_to :user
	belongs_to :assembly, dependent: :destroy
	has_many :ingredients, through: :quantity
	has_many :quantities, dependent: :destroy
	accepts_nested_attributes_for :quantities, reject_if: :reject_quantity, allow_destroy: true
	validates_presence_of :name
	has_attached_file :image, {
                                    :styles => { medium: "300x300#", small: "75x75#"},
                                    :size => { :in => 0..300.kilobytes }
                                }
  validates_attachment_content_type :image,
                                    :content_type => /^image\/(png|gif|jpeg)/

	def reject_quantity(attribute)
		attribute['ingredient_id'].blank? || attribute['weight'].blank?
	end

	def percentage_of(matter)
		recipe_weight = weight = self.quantities.collect { |q| q.weight }.sum
		matter_weight = self.quantities.collect { |q| (q.ingredient.send(matter) * (q.weight / 100)) }.sum
		matter_weight / recipe_weight * 100
	end

	def sum_of_kcal
		total = self.quantities.collect { |q| q.ingredient.kcal }.sum
		weight = self.quantities.collect { |q| q.weight }.sum
		total / weight unless weight == 0
	end

	def show_total(matter)
		self.quantities.collect { |q| q.send(matter) }.sum
	end

	def is_bio?
	end

	def is_gluten_free?
	end

end
