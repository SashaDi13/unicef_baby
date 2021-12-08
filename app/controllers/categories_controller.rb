class CategoriesController < ApplicationController
  before_action :load_categories, only: [:index]

  def index
  end

  def show
    @category = resource

    @articles = @category.articles
    @search = params["search"]
    @age = @search["age"] if @search.present?

    if @search.present?
      @articles = @articles.where('LOWER(title) LIKE ?',
                                  "%#{@search["title"].downcase}%")
      @articles = @articles.where("age LIKE ?",  "%#{@search["age"]}%")
      # @articles = @articles.where("age LIKE ?",  "%#{@search["age"]}%")
      @articles = @articles.where("subject LIKE ?",
                                  "%#{@search["subject"]}%")
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
