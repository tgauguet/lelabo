class TasksController < ApplicationController
	before_action :set_to_do_list

	def create
		@task = @list.tasks.new(tasks_params)
		if @task.save
			redirect_to (:back)
		else
			redirect_to @list
		end
	end

	def update
		@task = @list.task.find(params[:id])
		if @task.update(tasks_params)
			redirect_to (:back)
		else
			redirect_to(:back)
		end
	end

	def destroy
		@task = @list.task.find(params[:id])
		if @task.destroy
			redirect_to(:back)
		else
			redirect_to(:back)
		end
	end

	private

	def set_to_do_list
		@list = ToDoList.find(params[:to_do_list_id])
	end

	def tasks_params
		params.require(:task).permit(:name, :assigns_to, :due_date, :done, :details, :to_do_list_id)
	end
end