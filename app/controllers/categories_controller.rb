class CategoriesController < ApplicationController
  def index
    @categories = collection
  end

  def show
    @category = resource
    @articles = @category.articles

    if params["search"].present?
      # @articles = @category.articles.search(params["search"])
      @articles = @category.articles.title(params["search"]) if params["search"]["title"]
      @articles = @category.articles.age(params["search"]) if params["search"]["age"]
      @articles = @category.articles.subject(params["search"]) if params["search"]["subject"]
    end
  end

  private

    def collection
      Category.all
    end

    def resource
      collection.find(params[:id])
    end
end
