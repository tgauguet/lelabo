class ToDoList < ActiveRecord::Base
	belongs_to :user
	has_many :tasks, dependent: :destroy
	accepts_nested_attributes_for :tasks
end
