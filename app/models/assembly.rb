class Assembly < ActiveRecord::Base
	has_many :recipes, through: :recipe_item
	has_many :recipe_items, dependent: :destroy
	belongs_to :user
	has_paper_trail
	has_many :totals, dependent: :destroy
	has_many :images, dependent: :destroy
	validates_length_of :images, maximum: 8
	validates_presence_of :title
	accepts_nested_attributes_for :recipe_items, allow_destroy: true, reject_if: proc { |a| a['recipe_id'].blank? }
	accepts_nested_attributes_for :totals, allow_destroy: true
	accepts_nested_attributes_for :images, allow_destroy: true
	has_attached_file :image, {
                                    :styles => { medium: "300x300#", small: "75x75#"},
                                    :size => { :in => 0..300.kilobytes },
																		:default_url => "/images/missing-cake.png"
                                }
    validates_attachment_content_type :image,
                                    :content_type => /^image\/(png|gif|jpeg)/

	def total_cost
		self.recipe_items.collect { |i| i.recipe.total_cost }.sum
	end

	def recipe_weight
		self.recipe_items.collect { |i| i.recipe.recipe_weight }.sum
	end

	def kilo_cost
		total_cost / recipe_weight * 1000 unless recipe_weight == 0
	end

	def custom_cost
		self.kilo_cost * self.totals.first.value unless (recipe_weight == 0 || self.totals.first.nil?)
	end

end
