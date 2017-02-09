require 'barby'
require 'barby/barcode/ean_13'
require 'barby/outputter/html_outputter'

class RecipesController < ApplicationController
  include RecipesHelper
  helper_method :sort_columns, :sort_direction
  before_action :set_recipe, only: [:show, :edit, :update, :destroy, :balancing, :production_cost, :set_total, :download, :quantities_pdf, :d_quantities_pdf, :quantities_array_pdf, :d_quantities_array_pdf]
  before_action :set_user, only: [:index, :new, :create, :download]
  skip_before_filter :verify_authenticity_token, only: [:edit,:update]
  before_action :has_access?, only: [:show, :edit, :update, :destroy, :balancing, :production_cost, :set_total, :download, :quantities_pdf, :d_quantities_pdf]
  before_action :set_paper_trail_whodunnit

  # GET /recipes
  # GET /recipes.json
  def index
    @recipes = @user.recipes.all.paginate(page: params[:page], per_page: 20).order(sort_columns + " " + sort_direction)
  end

  # GET /recipes/1
  # GET /recipes/1.json
  def show
  end

  # GET /recipes/new
  def new
    @recipe = @user.recipes.new
    4.times { @quantity = @recipe.quantities.build }
  end

  # GET /recipes/1/edit
  def edit
    @totals = @recipe.totals.all.order("created_at ASC")
    if @recipe.bar && is_barcode?(@recipe.bar)
      @bar = Barby::EAN13.new(@recipe.bar.to_s)
      @barcode = Barby::HtmlOutputter.new(@bar)
    end
    @ingredient = @user.ingredients.new
    @sticker_value = @recipe.quantities.all.order_by_weight_in_grammes
    @categories = @user.category.all
    @images = @recipe.images.all.order("created_at ASC")
    respond_to do |format|
      format.html
      format.json { head :no_content }
      format.js { render :edit }
      format.pdf do
        render  pdf: @recipe.name,
                template: 'recipes/show.pdf.erb',
                encoding: "UTF-8",
                locals: { recipe: @recipe }
      end
    end
  end

  def download
    respond_to do |format|
      format.html
      format.pdf do
        @pdf = render_to_string  pdf: @recipe.name,
                template: 'recipes/show.pdf.erb',
                encoding: "UTF-8",
                locals: { recipe: @recipe }
        send_data(@pdf, :filename => @recipe.name,  :type=>"application/pdf")
      end
    end
  end

  def quantities_pdf
    @totals = @recipe.totals.all.order("created_at ASC")
    respond_to do |format|
      format.html
      format.pdf do
        render  pdf: @recipe.name,
                #orientation: 'Landscape',
                template: 'recipes/quantity.pdf.erb',
                encoding: "UTF-8",
                locals: { recipe: @recipe }
      end
    end
  end

  def d_quantities_pdf
    @totals = @recipe.totals.all.order("created_at ASC")
    respond_to do |format|
      format.html
      format.pdf do
        @pdf = render_to_string  pdf: @recipe.name,
                #orientation: 'Landscape',
                template: 'recipes/quantity.pdf.erb',
                encoding: "UTF-8",
                locals: { recipe: @recipe }
        send_data(@pdf, :filename => @recipe.name,  :type=>"application/pdf")
      end
    end
  end

  def quantities_array_pdf
    @totals = @recipe.totals.all.order("created_at ASC")
    respond_to do |format|
      format.html
      format.pdf do
        render  pdf: @recipe.name,
                orientation: 'Landscape',
                template: 'recipes/quantities.pdf.erb',
                encoding: "UTF-8",
                locals: { recipe: @recipe }
      end
    end
  end

  def d_quantities_array_pdf
    @totals = @recipe.totals.all.order("created_at ASC")
    respond_to do |format|
      format.html
      format.pdf do
        @pdf = render_to_string  pdf: @recipe.name,
                orientation: 'Landscape',
                template: 'recipes/quantities.pdf.erb',
                encoding: "UTF-8",
                locals: { recipe: @recipe }
        send_data(@pdf, :filename => @recipe.name,  :type=>"application/pdf")
      end
    end
  end

  # POST /recipes
  # POST /recipes.json
  def create
    @recipe = @user.recipes.new(recipe_params)
      if @recipe.save
        4.times { @recipe.totals.create(value:  (@recipe.totals.count + 1)) }
        redirect_to edit_recipe_path(@recipe)
        flash[:notice] = 'Recette crée avec succès'
        #format.json { render :edit, status: :created, location: edit_recipe_path }
      else
        redirect_to recipes_path
        flash[:error] = 'Erreur lors de la création de la recette'
      end
  end

  # PATCH/PUT /recipes/1
  # PATCH/PUT /recipes/1.json
  def update
    @recipe.allergen = [] if !defined?(params[:recipe][:allergen])
    respond_to do |format|
      if @recipe.update(recipe_params)
        if !request.url.include?("edit")
          format.html { redirect_to(:back) }
        else
          format.html { redirect_to edit_recipe_path(@recipe), notice: 'Recette modifiée avec succès' }
        end
        #format.json { render :edit, status: :ok, location: edit_recipe_path }
      else
        format.html { render :edit }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1
  # DELETE /recipes/1.json
  def destroy
    @recipe.destroy
    respond_to do |format|
      format.html { redirect_to recipes_url, notice: 'Recette supprimée avec succès' }
      format.json { head :no_content }
    end
  end

  private

  def has_access?
    @recipe = Recipe.find(params[:id])
    redirect_to page_error_path unless user_signed_in? && (@recipe.user_id == current_user.id)
  end

  def set_user
    @user = current_user
  end

  def sort_columns
    Recipe.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.fetch(:recipe, {}).permit(:name, :bar, :production_date, :production_number, :conservation, :consumption_days, :vat, {:allergen => []} , :fast, :array_unit, :unit, :portion_number, :portion_name, :stock, :to_produce, :sold, :total, :portion, :portion_weight, :preparation_minutes, :baking_minutes, :portion_price, :owner, :stared, :loved, :image, :baking, :ingredient_id, :description, :process, :note, :equipment, :category, :user_id, quantities_attributes: [:id, :weight, :ingredient_id, :unit, :_destroy], totals_attributes: [:value, :total,  :id, :_destroy], images_attributes:[:id, :_destroy, :picture, :recipe_id, :description])
  end

end
