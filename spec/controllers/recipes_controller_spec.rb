require 'rails_helper'

RSpec.describe RecipesController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Recipe. As you add validations to Recipe, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    FactoryGirl.attributes_for(:recipe)
  }

  let(:invalid_attributes) {
    { name: nil, description: nil, author: nil }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # RecipesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all recipes as @recipes" do
      recipe = Recipe.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:recipes)).to eq([recipe])
    end
  end

  describe "GET #show" do
    it "assigns the requested recipe as @recipe" do
      recipe = Recipe.create! valid_attributes
      get :show, {:id => recipe.to_param}, valid_session
      expect(assigns(:recipe)).to eq(recipe)
    end
  end

  describe "GET #new" do
    it "assigns a new recipe as @recipe" do
      get :new, {}, valid_session
      expect(assigns(:recipe)).to be_a_new(Recipe)
    end
  end

  describe "GET #edit" do
    it "assigns the requested recipe as @recipe" do
      recipe = Recipe.create! valid_attributes
      get :edit, {:id => recipe.to_param}, valid_session
      expect(assigns(:recipe)).to eq(recipe)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Recipe" do
        expect {
          post :create, {:recipe => valid_attributes}, valid_session
        }.to change(Recipe, :count).by(1)
      end

      it "assigns a newly created recipe as @recipe" do
        post :create, {:recipe => valid_attributes}, valid_session
        expect(assigns(:recipe)).to be_a(Recipe)
        expect(assigns(:recipe)).to be_persisted
      end

      it "redirects to the created recipe" do
        post :create, {:recipe => valid_attributes}, valid_session
        expect(response).to redirect_to(Recipe.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved recipe as @recipe" do
        post :create, {:recipe => invalid_attributes}, valid_session
        expect(assigns(:recipe)).to be_a_new(Recipe)
      end

      it "re-renders the 'new' template" do
        post :create, {:recipe => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested recipe" do
        recipe = Recipe.create! valid_attributes
        put :update, {:id => recipe.to_param, :recipe => new_attributes}, valid_session
        recipe.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested recipe as @recipe" do
        recipe = Recipe.create! valid_attributes
        put :update, {:id => recipe.to_param, :recipe => valid_attributes}, valid_session
        expect(assigns(:recipe)).to eq(recipe)
      end

      it "redirects to the recipe" do
        recipe = Recipe.create! valid_attributes
        put :update, {:id => recipe.to_param, :recipe => valid_attributes}, valid_session
        expect(response).to redirect_to(recipe)
      end
    end

    context "with invalid params" do
      it "assigns the recipe as @recipe" do
        recipe = Recipe.create! valid_attributes
        put :update, {:id => recipe.to_param, :recipe => invalid_attributes}, valid_session
        expect(assigns(:recipe)).to eq(recipe)
      end

      it "re-renders the 'edit' template" do
        recipe = Recipe.create! valid_attributes
        put :update, {:id => recipe.to_param, :recipe => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested recipe" do
      recipe = Recipe.create! valid_attributes
      expect {
        delete :destroy, {:id => recipe.to_param}, valid_session
      }.to change(Recipe, :count).by(-1)
    end

    it "redirects to the recipes list" do
      recipe = Recipe.create! valid_attributes
      delete :destroy, {:id => recipe.to_param}, valid_session
      expect(response).to redirect_to(recipes_url)
    end
  end

end
