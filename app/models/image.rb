#!/usr/env/bin ruby
#encoding: utf-8

class Image < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :assembly
  validate :limit_images, on: :create
	has_attached_file :picture, {
                                    :styles => { medium: "300x300#", small: "75x75#"},
                                    :size => { :in => 0..300.kilobytes }
                                }
  validates_attachment_content_type :picture,
                                    :content_type => /^image\/(png|gif|jpeg)/

  def limit_images
		if self.recipe.images(:reload).size > 8
			fail "Le nombre d'images est limité à 8 par recette"
		end
	end
end