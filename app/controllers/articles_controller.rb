class ArticlesController < ApplicationController
  def index
    @articles = if params[:category_id]
      collection.joined_includes_values
    else
      collection
    end
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

    def find_article
      @article = resource
    end
end
