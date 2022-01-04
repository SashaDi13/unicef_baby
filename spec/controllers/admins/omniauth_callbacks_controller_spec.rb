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

      it 'return Admin with google' do
        expect(Admin.from_omniauth(auth)).to be_persisted
        expect(Admin.from_omniauth(auth).provider).to eq('google')
        expect(Admin.from_omniauth(auth).uid).to eq("1076060026507")
      end
    end
  end
end
