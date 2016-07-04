class AssembliesController < ApplicationController
	before_action :set_assembly, only: [:update, :destroy]

	def new
		@assembly = Assembly.new
	end

	def create
		@assembly = Assembly.create(assembly_params)
		render nothing: true
	end

	def destroy
	end

	def update 
	end

	private

	def set_assembly
		@current_assembly = Assembly.find(params[:id])
	end

	def assembly_params
		params.require(:assembly).permit(:recipe_id, :image, :description, :title)
	end
end
