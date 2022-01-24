class Api::V1::CategoriesController < Api::V1::ApiController
  def show
    @category = resource
    @articles = @category.articles.search(params[:search])

    render json: { category: @category, articles: @articles }
  end

  private

    def collection
      Category.all
    end

    def resource
      collection.find(params[:id])
    end
end
