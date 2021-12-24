class CategoriesController < ApplicationController
  def index
    @categories = collection
  end

  def show
    @category = resource
    @articles = @category.articles
  end

  def search
    @category = resource
    @articles = @category.articles

    @articles = @category.articles.search(params["search"]) if params["search"].present?
    render partial: "categories/search_results"
  end

  private

    def collection
      Category.all
    end

    def resource
      if params[:category_id]
        collection.find(params[:category_id])
      else
        collection.find(params[:id])
      end
    end
end
