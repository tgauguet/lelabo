class Task < ActiveRecord::Base
	belongs_to :to_do_list
	validates_presence_of :name

	def day
		self.due_date[0,2]
	end

	def month
		self.due_date[3..5]
	end

	def no_date
		self.due_date.nil? || self.due_date == ""
	end

	def not_assigned
		self.assigns_to.nil? || self.assigns_to == ""
	end
end
