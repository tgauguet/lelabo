#!/usr/bin/env ruby
#encoding: utf-8

class StaffsController < ApplicationController
  helper_method :sort_columns, :sort_direction
  before_action :set_paper_trail_whodunnit
  before_action :set_staff, only: [:show, :edit, :update, :destroy]
  before_action :set_user

  # GET /staffs/1
  # GET /staffs/1.json
  def show
  end

  # GET /staffs/new
  def new
    @staffs = @user.staffs.all.paginate(page: params[:page], per_page: 20).order("name ASC")
    @staff = @user.staffs.new
  end

  # GET /staffs/1/edit
  def edit
    @staffs = @user.staffs.all.paginate(page: params[:page], per_page: 20).order("name ASC")
  end

  # POST /staffs
  # POST /staffs.json
  def create
    @staff = Staff.new(staff_params)
    respond_to do |format|
      if @staff.save
        format.html { redirect_to edit_staff_path(@staff), notice: 'Nouveau collaborateur créé avec succès !' }
        format.json { render :edit, status: :created, location: @staff }
      else
        format.html { render :new }
        format.json { render json: @staff.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /staffs/1
  # PATCH/PUT /staffs/1.json
  def update
    respond_to do |format|
      if @staff.update(staff_params)
        format.html { redirect_to edit_staff_path(@staff), notice: 'Le collaborateur a bien été modifié.' }
        format.json { render :edit, status: :ok, location: @staff }
      else
        format.html { render :edit }
        format.json { render json: @staff.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /staffs/1
  # DELETE /staffs/1.json
  def destroy
    @staff.destroy
    respond_to do |format|
      format.html { redirect_to staffs_url, notice: 'Collaborateur supprimé.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_staff
      @staff = Staff.find(params[:id])
    end

    def sort_columns
  		Provider.column_names.include?(params[:sort]) ? params[:sort] : "name"
  	end

  	def sort_direction
  		%w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  	end

    def set_user
      @user = current_user
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def staff_params
      params.fetch(:staff, { }).permit(:name, :firstname, :job, :email, :phone, :city, :address, :photo, :employed_since, :user_id, :postal, :cost_by_hour)
    end
end
