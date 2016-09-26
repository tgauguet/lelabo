class Assembly < ActiveRecord::Base
	has_many :recipes
	belongs_to :user
	has_attached_file :image, {
                                    :styles => { medium: "300x300#", small: "75x75#"},
                                    :size => { :in => 0..300.kilobytes }
                                }
    validates_attachment_content_type :image, 
                                    :content_type => /^image\/(png|gif|jpeg)/

	def total_cost
		sum = 0
		self.recipes.total_price.each { |a| sum += a }
	end
end
