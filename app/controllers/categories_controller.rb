class CategoriesController < ApplicationController
  def index
    @categories = collection
  end

  def show
    @category = resource
    @articles = @category.articles

    if params["search"].present?
      params["search"]["age"] = Article::AGE if params["search"]["age"].nil?
      params["search"]["subject"] = Article::SUBJECT if params["search"]["subject"].nil?
      @articles = @category.articles.search(params["search"])
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
