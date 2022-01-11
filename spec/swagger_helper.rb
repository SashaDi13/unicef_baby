# frozen_string_literal: true
# require 'rspec/rails/swagger'
require 'rails_helper'

RSpec.configure do |config|
  # Specify a root folder where Swagger JSON files are generated
  # NOTE: If you're using the rswag-api to serve API descriptions, you'll need
  # to ensure that it's configured to serve Swagger from the same folder
  config.swagger_root = Rails.root.join('swagger').to_s

  # Define one or more Swagger documents and provide global metadata for each one
  # When you run the 'rswag:specs:swaggerize' rake task, the complete Swagger will
  # be generated at the provided relative path under swagger_root
  # By default, the operations defined in spec files are added to the first
  # document below. You can override this behavior by adding a swagger_doc tag to the
  # the root example_group in your specs, e.g. describe '...', swagger_doc: 'v2/swagger.json'
  config.swagger_docs = {
    'v1/swagger.yaml' => {
      swagger: '2.0',
      info: {
        title: 'API V1',
        version: 'v1'
      },
      definitions: {
        createArticle: {
          type: :object,
          properties: {
            data: {
              type: :object,
              required: %i[title, description, category_id, published_at, image, age, subject],
              properties: {
                title: { type: :string, example: 'title' },
                description: { type: :string, example: 'this about article' },
                category_id: { type: :bigint, example: '1' },
                published_at: { type: :datetime, example: 'Wed, 05 Jan 2022 13:13:08.710789000 UTC +00:00' },
                image: { type: :string, example: '/uploads/article/image/23/4.png' },
                age: { type: :string, example: '0-3 mounth' },
                subject: { type: :string, example: 'dream' }
              }
            }
          }
        }
      }
    }
  }

  # Specify the format of the output Swagger file when running 'rswag:specs:swaggerize'.
  # The swagger_docs configuration option has the filename including format in
  # the key, this may want to be changed to avoid putting yaml in json files.
  # Defaults to json. Accepts ':json' and ':yaml'.
  config.swagger_format = :yaml
end
