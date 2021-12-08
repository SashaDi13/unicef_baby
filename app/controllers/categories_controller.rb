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
