class Task < ActiveRecord::Base
	belongs_to :to_do_list
	validates_presence_of :name
end
