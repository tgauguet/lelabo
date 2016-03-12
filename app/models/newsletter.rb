class Newsletter < ActiveRecord::Base
	validates :email, :uniqueness => {:case_sensitive => false}
    validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
end
