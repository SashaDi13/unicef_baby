class CategoriesController < ApplicationController
  before_action :load_categories, only: [:index]

  def index
  end

  def show
    @category = resource
  end

  private

    def collection
      Category.all
    end

    def resource
      collection.find(params[:id])
    end
end
