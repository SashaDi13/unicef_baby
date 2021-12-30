require 'rails_helper'

RSpec.describe Admins::OmniauthCallbacksController, :type => :controller do

  describe "allows logged in admins" do
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:admin]
      Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]
    end

    # let(:admin){ create(:admin) }

    context 'Success handling' do

      before(:each) do
        # request.env['omniauth.auth'] = FactoryBot.create(:auth, :google)
        get :google_oauth2
      end

      let(:admin) { create(:admin) }

      it 'should set current_admin to proper admin' do
        expect(subject.current_admin).to eq(admin)
      end

    end
  #
  #   context 'if not admin' do
  #     let(:email) { 'test_mail@gmail.com' }
  #
  #     it 'if admin not persisted' do
  #       post :google_oauth2
  #
  #       expect(response).to redirect_to(new_admin_session_path)
  #     end
  #   end
  #
  #   context 'if admin' do
  #     let(:email) { admin.email }
  #
  #     it 'login admin' do
  #       post :google_oauth2
  #
  #       expect(response).to redirect_to(root_path)
  #     end
  #   end
  #
  end



end
