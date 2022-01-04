require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do
  describe "#main" do
    it "renders the index template" do
      get :main
      expect(response).to render_template("main")
      expect(response.body).to eq ""
    end
  end

  describe "#about" do
    it "renders the index template" do
      get :about
      expect(response).to render_template("about")
      expect(response.body).to eq ""
    end
  end

  describe "#contact" do
    it "renders the index template" do
      get :contact
      expect(response).to render_template("contact")
      expect(response.body).to eq ""
    end
  end
end
