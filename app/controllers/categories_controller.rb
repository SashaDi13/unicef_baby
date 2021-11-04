class CategoriesController < ApplicationController
  def index
    @categories = collection
  end

  def show
    @category = resource
  end

  private

    def collection
      Category.all
    end

    def resource
      # if params[:category_id]
      #   collection.find(params[:category_id])
      # else
      collection.find(params[:id])
      # end
    end
end
