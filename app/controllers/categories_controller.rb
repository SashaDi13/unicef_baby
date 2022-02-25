class CategoriesController < ApplicationController
  def index
    @categories = collection
  end

  def show
    @category = resource
    @articles = @category.articles.search(params[:search])
    session["search_#{@category.id}"] = request.url if params[:search].present?
  end

  private

    def collection
      Category.all
    end

    def resource
      collection.find(params[:id])
    end
end
