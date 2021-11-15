require 'rails_helper'

RSpec.describe "Categories", type: :request do
  describe "GET /categories" do
    it "returns http success status" do
      get categories_path

      expect(response).to be_successful
    end
  end

  describe "GET /categories/:id" do
    let(:category) { :helth }

    it "returns http success status" do
      get category_articles_path(:helth)

      expect(response).to be_successful
    end
  end
end
