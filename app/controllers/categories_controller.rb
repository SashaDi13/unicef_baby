class CategoriesController < ApplicationController
  before_action :load_categories, only: [:index]

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

    @articles = @category.articles
  end
  private

    def collection
      Category.all
    end

    def resource
      collection.find(params[:id])
    end
end
