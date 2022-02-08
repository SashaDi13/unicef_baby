require 'rails_helper'

RSpec.describe "Documents", type: :request do
  describe "GET /documents" do
    let(:document) { create(:document, title: "Document") }
    it "returns http success status" do

      get documents_path

      expect(response).to be_successful
      expect(response.body).to include(document.title)
    end
  end
end
