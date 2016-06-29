#!usr/bin/env ruby
# encoding: utf-8

class ToDoListsController < ApplicationController
	before_action :set_user, only: [:new, :index, :show, :destroy, :update]
	before_action :current_list, only: [:update, :show, :destroy, :update]
	before_action :set_lists, only: [:new, :destroy]
	skip_before_filter :verify_authenticity_token 

	def show
		@task = @list.tasks.new
		@tasklist = @list.tasks.where(done: false).order('priority ASC')
		@done = @list.tasks.where(done: true).order('priority ASC')
	end

	def new
		@list = @user.to_do_lists.new
	end 

	def sort
		# adjust the position of each task with jquery sortable
		# inspired by tutorial : http://josephndungu.com/tutorials/ajax-sortable-lists-rails-4
		params[:order].each do |key, value|
			Task.find(value[:id]).update_attribute(:priority, value[:position])
		end
		render :nothing => true
	end

	def resort
		params[:order].each do |key, value|
			ToDoList.find(value[:id]).update_attribute(:priority, value[:position])
		end
		render :nothing => true
	end

	def create
		@list = @user.to_do_lists.new(list_params)
		if @list.save
			redirect_to @list
		else
			render :new
		end
	end

	def update
		@list.update(list_params)
		redirect_to to_do_list_path
	end

	def destroy
		@list.destroy
		render :nothing => true
	end

	private

	def set_user
		@user = current_user
	end

	def current_list
		@list = @user.to_do_lists.find(params[:id])
	end

	def set_lists
		@lists = @user.to_do_lists.all.order('priority ASC')
	end

	def list_params
		params.require(:to_do_list).permit(:id, :title, :description, :user_id, tasks_attributes: [:id, :name, :details, :done, :due_date, :assigns_to] )
	end

end
