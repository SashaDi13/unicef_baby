require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /users" do
    it "returns http success status" do

      get users_path

      expect(response).to be_successful
      expect(response.body).to include(User.first.name)
    end
  end
end
