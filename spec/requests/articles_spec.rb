require 'rails_helper'

RSpec.describe "Articles", type: :request do
  describe "GET /articles" do
    it "returns http success status" do
      get articles_path

      expect(response).to be_successful
    end
  end

  describe "GET /articles/:id" do
    category = Category.find(1)
    let(:article) { create(:article, category: category, published_at: Time.zone.now - 10.minutes) }
    it "returns http success status" do
      get category_article_path(category.id, article.id)

      expect(response).to be_successful
    end
  end
end
