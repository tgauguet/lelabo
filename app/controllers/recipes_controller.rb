class RecipesController < ApplicationController
  helper_method :sort_columns, :sort_direction
  before_action :set_recipe, only: [:show, :edit, :update, :destroy, :balancing, :production_cost, :set_total]
  before_action :set_user, only: [:index, :new, :create]

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
    @quantity = @recipe.quantities.build
  end

  # GET /recipes/1/edit
  def edit
    @totals = @recipe.totals.all.order("id ASC")
  end

  # POST /recipes
  # POST /recipes.json
  def create
    @recipe = @user.recipes.new(recipe_params)

      if @recipe.save
        4.times { @recipe.totals.create(value:  (@recipe.totals.count + 1)) }
        redirect_to edit_recipe_path(@recipe)
        flash[:notice] = 'Recette créée avec succès'
        #format.json { render :edit, status: :created, location: edit_recipe_path }
      else
        format.html { render :new }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
  end

  # PATCH/PUT /recipes/1
  # PATCH/PUT /recipes/1.json
  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to edit_recipe_path(@recipe), notice: 'Recette modifiée avec succès' }
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
      params.fetch(:recipe, {}).permit(:name, :total, :owner, :stared, :image, :baking, :ingredient_id, :description, :process, :note, :equipment, :category, :user_id, quantities_attributes: [:id, :weight, :ingredient_id, :_destroy], totals_attributes: [:value, :total,  :id, :_destroy])
    end
end
