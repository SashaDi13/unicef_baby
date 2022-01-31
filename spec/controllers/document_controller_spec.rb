require 'rails_helper'

RSpec.describe DocumentsController, type: :controller do
  let(:document) { create(:document) }
  describe "GET #index" do
    it "renders the index template" do
      get :index
      expect(response).to render_template("documents/index")
    end
  end
  context "if admin" do
    login_admin
    describe "GET #new" do
      it "returns http success if signed in as admin" do
        get :new
        expect(response).to render_template("documents/new")
      end
    end

    context "valid params" do
      describe "POST #create" do
        it 'creates document with valid params' do
          post :create, params: { document: { name: "Document" }}
          expect(response).to be_successful
        end
      end
    end

    context "invalid params" do
      describe "POST #create" do
        it 'does not create document with invalid params' do
          post :create, params: { document: { name: nil } }
          expect(response).to render_template("documents/new")
        end
      end
    end
  end
end
