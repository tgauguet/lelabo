#!usr/bin/env ruby
#encoding: utf-8

class AssembliesController < ApplicationController
	before_action :set_assembly, only: [:show, :edit, :update, :destroy, :download]
	before_action :set_user
	helper_method :sort_columns, :sort_direction
	skip_before_filter :verify_authenticity_token, only: [:edit,:update]
	before_action :has_access?, only: [:show, :edit, :update, :destroy, :download]

	def index
		@assemblies = @user.assemblies.all.paginate(page: params[:page], per_page: 20).order(sort_columns + " " + sort_direction)
	end

	def show
	end

	def new
		@assembly = @user.assemblies.new
	end

	def create
		@assembly = @user.assemblies.create(assembly_params)
		if @assembly
			@assembly.measures.create
			4.times { @assembly.totals.create(value:  (@assembly.totals.count + 1)) }
			redirect_to edit_assembly_path(@assembly)
			flash[:success] = "Vous avez créé un nouveau montage"
		else
			redirect_to assemblies_path
			flash[:error] = "Erreur lors de la création du montage"
		end
	end

	def destroy
		if @assembly.destroy
			redirect_to assemblies_path
			flash[:success] = "Le montage a été supprimé"
		else
			redirect_to(:back)
			flash[:error] = "Erreur lors de la suppression du montage"
		end
	end

	def edit
		@totals = @assembly.totals.all.order("created_at ASC")
		@images = @assembly.images.all.order("created_at ASC")
		respond_to do |format|
      format.html
      format.js { render :edit }
      format.pdf do
        render  pdf: '@user.name',
                template: 'assemblies/show.pdf.erb',
                encoding: "UTF-8",
                locals: { assembly: @assembly }
      end
    end
	end

	def download
    respond_to do |format|
      format.html
      format.pdf do
        @pdf = render_to_string  pdf: '@user.name',
                template: 'assemblies/show.pdf.erb',
                encoding: "UTF-8",
                locals: { assembly: @assembly }
        send_data(@pdf, :filename => @assembly.title,  :type=>"application/pdf")
      end
    end
  end

	def update
			respond_to do |format|
				if @assembly.update(assembly_params)
					if !request.url.include?("edit")
						format.html { redirect_to(:back) }
					else
						format.html { redirect_to edit_assembly_path(@assembly), notice: 'Montage modifié avec succès' }
					end
					#format.json { render :edit, status: :ok, location: edit_recipe_path }
				else
					format.html { render :edit }
					format.json { render json: @assembly.errors, status: :unprocessable_entity }
				end
			end
	end

	private

	def has_access?
		@assembly= Assembly.find(params[:id])
		redirect_to page_error_path unless user_signed_in? && (@assembly.user_id == current_user.id)
	end

	def sort_columns
		Assembly.column_names.include?(params[:sort]) ? params[:sort] : "title"
	end

	def sort_direction
		%w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
	end

	def set_user
		@user = current_user
	end

	def set_assembly
		@assembly = Assembly.find(params[:id])
	end

	def assembly_params
		params.require(:assembly).permit(:recipe_id, :image, :stock, :to_produce, :sold, :category, :notes, :recipes, :description, :title, :owner, :loved, :stared, images_attributes: [:picture, :assembly_id , :description, :_destroy, :id], totals_attributes: [:value, :total,  :id, :_destroy], recipe_items_attributes: [:id, :_destroy, :assembly_id, :total])
	end
end
