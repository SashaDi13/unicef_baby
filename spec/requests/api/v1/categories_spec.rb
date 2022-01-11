require 'swagger_helper'

RSpec.describe 'api/v1/categories/:id', type: :request do
  let(:category) { create(:category) }
  let(:articles) { create_list(:article, 4, category_id: category.id)}
  # let(:response_json) { JSON.parse(response.body) }

  describe 'GET #show' do
    before :each do
      get api_v1_category_path(category)
    end
    it 'returns http success' do
      response_json = JSON.parse(response.body)

      expect(response_json['category'].size).to eq(4)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
  end
end
