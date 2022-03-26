require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  before do
    @file = "spec/files/users/users.xlsx"
  end

  describe "GET #index" do
    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "POST #import" do
    let(:user) { User.first }
    it "create user" do
      post :import, params: {import: {file: @file}}
      expect(User.count).to eq(7)
      expect(user.name).to eq("John Smith")
      expect(user.parent_id).to eq(0)
      expect(User.find(2).parent_id).to eq(1)
    end
  end
end
