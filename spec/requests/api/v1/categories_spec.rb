require 'swagger_helper'

RSpec.describe 'api/v1/categories/:id', type: :request, document_response: true do

  let!(:category) { create(:category) }
  let(:id) { category.id }

  path '/api/v1/categories/{id}' do
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show category') do
      produces "application/json"
      let!(:articles) { create_list(:article, 4, category_id: id) }

      response(200, 'successful') do
        let(:response_json) { JSON.parse(response.body) }

        it 'should has category data' do
          expect(response_json["category"]["id"]).to eq(id)
          expect(response_json["category"]["name"]).to eq(category.name)
        end

        it 'should has 4 articles' do
          expect(response_json["articles"].count).to eq(4)
        end

        it 'should has articles data' do
          expect(response_json["articles"].first["id"]).to eq(articles.first.id)
          expect(response_json["articles"].first["title"]).to eq(articles.first.title)
        end

        run_test!
      end
    end
  end
end
