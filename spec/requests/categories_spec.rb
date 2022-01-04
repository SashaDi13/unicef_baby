require 'rails_helper'

RSpec.describe "Categories", type: :request do
  describe "GET /categories" do
    it "returns http success status" do
      get categories_path

      expect(response).to be_successful
    end
  end

  describe "GET /categories/:id" do
    let(:category) { create(:category) }

    it "returns http success status" do
      get category_path(category)

      expect(response).to be_successful
    end
  end
end
