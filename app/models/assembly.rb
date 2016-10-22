class Assembly < ActiveRecord::Base
	has_many :recipes, through: :recipe_item
	has_many :recipe_items, dependent: :destroy
	belongs_to :user
	has_many :images, dependent: :destroy
	accepts_nested_attributes_for :recipe_items, allow_destroy: true
	accepts_nested_attributes_for :images, allow_destroy: true
	has_attached_file :image, {
                                    :styles => { medium: "300x300#", small: "75x75#"},
                                    :size => { :in => 0..300.kilobytes },
																		:default_url => "/images/missing-cake.png"
                                }
    validates_attachment_content_type :image,
                                    :content_type => /^image\/(png|gif|jpeg)/

	def total_cost
		sum = 0
		self.recipes.total_price.each { |a| sum += a }
	end
end
