require 'swagger_helper'

RSpec.describe 'api/v1/categories', type: :request do
  let(:category) { create(:category) }
  let(:article) { create(:article, category_id: category.id) }

  describe 'GET #show' do
    it 'returns http success' do
      get api_v1_category_path(category)
      response_json = JSON.parse(response.body)

      expect(response_json['category']['article']['title']).to include(article.title)
    end
  end
end
