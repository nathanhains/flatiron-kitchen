class RecipesController < ApplicationController
    def new
        @recipe = Recipe.new
        @ingredient = @recipe.ingredients.new
    end

    def create
        @recipe = Recipe.new(recipe_params)
        if @recipe.save
            redirect_to recipe_path(@recipe)
        else
            render :new
        end
    end

    def show
        find_recipe
    end

    def edit
        find_recipe
    end

    def update
        find_recipe
        if @recipe.update(recipe_params)
            redirect_to recipe_path(@recipe)
        else
            render :edit
        end
    end

    private

    def recipe_params
        params.require(:recipe).permit(:name, ingredient_ids: [])
    end

    def find_recipe
        @recipe = Recipe.find(params[:id])
    end
end
