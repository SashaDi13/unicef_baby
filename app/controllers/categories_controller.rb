class CategoriesController < ApplicationController
  def index
    @categories = collection
  end

  def show
    @category = resource
    @articles = @category.articles.search(params[:search])
  end

  private

    def collection
      Category.all
    end

    def resource
      collection.find(params[:id])
    end
end
