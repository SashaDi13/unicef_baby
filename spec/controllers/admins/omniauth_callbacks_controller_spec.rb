require 'rails_helper'

RSpec.describe Admins::OmniauthCallbacksController, type: :controller do
  describe "allows logged in admins" do
    context 'if admin' do
      let!(:admin) { create(:admin, provider: 'google',
        uid: "1076060026507") }
      let(:auth) { OmniAuth::AuthHash.new(
        provider: admin.provider,
        uid: admin.uid,
        info: {
          email: admin.email,
          login: admin.login
        }
      )}

      let(:data_from_google) { Admin.from_omniauth(auth) }

      it 'return Admin with google' do
        expect(data_from_google).to be_persisted
        expect(data_from_google.provider).to eq('google')
        expect(data_from_google.uid).to eq("1076060026507")
      end
    end
  end
end
