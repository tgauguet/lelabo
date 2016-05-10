#!usr/bin/env ruby
# encoding: utf-8

class ToDoListsController < ApplicationController
	before_action :set_user, only: [:new, :index, :show, :destroy, :update]
	before_action :current_list, only: [:update, :show, :destroy, :update]
	before_action :set_lists, only: [:new, :destroy]
	skip_before_filter :verify_authenticity_token 

	def show
		@task = @list.tasks.new
		@tasklist = @list.tasks.where(done: false).order('created_at ASC')
		@done = @list.tasks.where(done: true).order('created_at ASC')
	end

	def new
		@list = @user.to_do_lists.new
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
	end

	private

	def set_user
		@user = current_user
	end

	def current_list
		@list = @user.to_do_lists.find(params[:id])
	end

	def set_lists
		@lists = @user.to_do_lists.all
	end

	def list_params
		params.require(:to_do_list).permit(:id, :title, :description, :user_id, tasks_attributes: [:id, :name, :details, :done, :due_date, :assigns_to] )
	end

end
