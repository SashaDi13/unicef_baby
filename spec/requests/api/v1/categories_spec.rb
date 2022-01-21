require 'swagger_helper'

RSpec.describe 'api/v1/categories/:id', type: :request do
  describe 'Category API' do
    category = Category.first
    let(:id) { category.id }

    path "/api/v1/categories/{id}" do
      get 'Lists category articles' do
        tags 'category'
        consumes 'application/json'
        produces 'application/json'

        let(:articles) { create_list(:article, 4, category_id: category.id)}
        let(:response_json) { JSON.parse(response.body) }

        response '200', 'lists articles' do
          it 'Return 4 articles' do
            expect(response_json['category'].count).to eq(4)
          end

          parameter name: :id, in: :path, type: :integer

          schema type: :object,
           properties: {
             activities: {
               type: :array,
               items: {
                 properties: {
                   title: { type: :string },
                   published_at: { type: :datetime },
                   image: { type: :string }
                 },
                 required: %i[title, published_at, image]
               }
             }
           }
          run_test!
        end
      end
    end
  end
end
