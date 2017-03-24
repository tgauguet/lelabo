#!/usr/env/bin ruby
#encoding: utf-8

class Image < ActiveRecord::Base
  belongs_to :recipe
  validate :limit_images, on: :create
	has_attached_file :picture, {
                                    :styles => { medium: "300x300#", small: "75x75#"},
                                    :size => { :in => 0..300.kilobytes },
                                    :default_url => "/images/missing-cake2.png"
                                }
  validates_attachment_content_type :picture,
                                    :content_type => /^image\/(png|gif|jpeg)/

  def limit_images
		if (self.recipe && self.recipe.images(:reload).size > 8) || (self.assembly && self.assembly.images(:reload).size > 8)
			fail "Le nombre d'images est limité à 8 par recette"
		end
	end
end
