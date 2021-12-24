class CategoriesController < ApplicationController
  before_action :load_categories, only: [:index]

  def index
    @categories = collection
  end

  def show
    @category = resource

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
