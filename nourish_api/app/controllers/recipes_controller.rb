class RecipesController < ApplicationController
  before_action :set_user, only: [:index, :create]
  before_action :set_recipe, only: [:show, :update, :destroy]

  # GET /recipes
  def index
    @recipes = recipe.all
    render json: @recipes, status: :ok
  end

  # POST /recipes
  def create
    @recipe = Recipe.create!(recipe_params)
    render json: @recipe, status:  :created
  end

  # GET /recipes/:id
  def show
    render json: @recipe, status: :ok
  end

  # PUT /recipes/:id
  def update
    @recipe.update(recipe_params)
    head :no_content
  end

  # DELETE /recipes/:id
  def destroy
    @recipe.destroy
    head :no_content
  end

  private

  def recipe_params
    # whitelist params
    params.permit(:title, :user_id, :source, :servings, :description)
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

end
