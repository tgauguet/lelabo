class TasksController < ApplicationController
	before_action :set_to_do_list
	respond_to :html, :js

	def create
		@task = @list.tasks.new(tasks_params)
		if @task.save
			redirect_to (:back)
		else
			redirect_to @list
		end
	end

	def done
		@task = @list.tasks.find(params[:id])
		if !@task.done? 
			@task.update_attributes(done: true)
		else
			@task.update_attributes(done: false)
		end
		@tasklist = @list.tasks.where(done: false).order('created_at ASC')
		@done = @list.tasks.where(done: true).order('created_at ASC')
	end

	def update
		@task = @list.tasks.find(params[:id])
		@task.update(tasks_params)
	end

	def destroy
		@task = @list.tasks.find(params[:id])
		@task.destroy
	end

	private

	def set_to_do_list
		@list = ToDoList.find(params[:to_do_list_id])
	end

	def tasks_params
		params.require(:task).permit(:name, :assigns_to, :due_date, :done, :details, :to_do_list_id, :done)
	end
end