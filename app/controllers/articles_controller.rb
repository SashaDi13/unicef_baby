class ArticlesController < ApplicationController
  def index
    @articles = if params[:category_name]
      collection.by_category_name(params[:category_name])
    else
      collection
    end.ordered
  end

  def show
    @article = resource
  end

  private

  def collection
    Article.published
  end

  def resource
    collection.find(params[:id])
  end
end
