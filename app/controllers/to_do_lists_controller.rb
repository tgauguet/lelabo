#!usr/bin/env ruby
# encoding: utf-8

class ToDoListsController < ApplicationController
	before_action :set_user, only: [:new, :index, :destroy]
	before_action :current_list, only: [:update, :show, :destroy]
	before_action :set_lists, only: [:new, :destroy]

	def show
		@task = @list.tasks.new
		@build = @list.tasks.build
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
	end

	def destroy
		@list.destroy
		respond_to do |format|
			format.html { redirect_to @todolist }
			format.js { }
		end
	end

	def set_user
		@user = current_user
	end

	def current_list
		@list = @user.to_do_lists.find(params[:id])
	end

	def set_lists
		@lists = @user.to_do_lists.all
	end

	private

	def list_params
		params.require(:to_do_list).permit(:title, :description, :user_id)
	end

end
