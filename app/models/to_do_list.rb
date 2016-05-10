class ToDoList < ActiveRecord::Base
	belongs_to :user
	has_many :tasks, dependent: :destroy
	accepts_nested_attributes_for :tasks

	def done_count
		self.tasks.where(done: true).count
	end

	def total_tasks
		self.tasks.count
	end

	def all_done
		(self.done_count == self.total_tasks) unless self.total_tasks == 0
	end
end
