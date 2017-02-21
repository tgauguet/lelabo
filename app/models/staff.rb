class Staff < ActiveRecord::Base
  belongs_to :user
  has_paper_trail
  has_attached_file :photo, {
                                    :styles => { medium: "300x300#", small: "75x75#"},
                                    :size => { :in => 0..300.kilobytes },
																		:default_url => "/images/missing-cake.png"
                                }
    validates_attachment_content_type :photo,
                                    :content_type => /^image\/(png|gif|jpeg)/
end
