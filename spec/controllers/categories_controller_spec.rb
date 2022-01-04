require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  let(:category) { create(:category) }
  let(:article) { create(:article, category_id: category.id,
                                   published_at: Time.zone.now - 10.minutes) }
  describe "#index" do
    it "renders the index template" do
      get :index
      expect(response).to render_template("categories/index")
      expect(response.body).to eq ""
    end
  end

  describe "#show" do
    it "renders the index template" do
      get :show, params: {id: article.category_id}
      expect(response).to render_template("categories/show")
      expect(response.body).to eq ""
    end
  end

  describe "#search" do

  end
end
