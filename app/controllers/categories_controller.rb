class CategoriesController < ApplicationController
  before_action :load_categories, only: [:index]

  def index
  end

  def show
    @category = resource

    @articles = @category.articles
    @search = params["search"]
    @filter_by_age = params["filter_by_age"]
    if @search.present?
      @title = @search["title"]
      @articles = @category.articles.where('LOWER(title) LIKE ?', "%#{@title.downcase}%")
    end
    if @filter_by_age.present?
      @age = @filter_by_age["age"]
      @articles = @category.articles.where("age = ?", @age)
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
