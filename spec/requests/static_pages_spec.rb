require 'rails_helper'

RSpec.describe "StaticPages", type: :request do
  describe "GET main" do
    it "returns http success" do
      get root_path
      expect(response).to be_successful
    end
  end

  describe "GET about" do
    it "returns http success" do
      get about_path
      expect(response).to be_successful
    end
  end

  describe "GET contact" do
    it "returns http success" do
      get contact_path
      expect(response).to be_successful
    end
  end

end
