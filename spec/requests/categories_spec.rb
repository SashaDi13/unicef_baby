require 'rails_helper'

RSpec.describe "Categories", type: :request do
  describe "GET /categories" do
    it "returns http success status" do
      get categories_path

      expect(response).to be_successful
    end
  end

  describe "GET /categories/:id" do
    category = Category.find(1)

    it "returns http success status" do
      get category_articles_path(category.id)

      expect(response).to be_successful
    end
  end
end
