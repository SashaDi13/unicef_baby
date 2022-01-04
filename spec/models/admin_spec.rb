require 'rails_helper'

RSpec.describe Admin, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of :login }
  end

  describe ".from omniauth" do
    context "existing admin" do
      let(:admin) { create(:admin) }
      let(:auth) { OmniAuth::AuthHash.new(
         provider: admin.provider,
         uid: admin.uid,
         info: {
           email: admin.email,
           login: admin.login
         }
      )}

      it "should sign in" do
        expect(Admin.from_omniauth(auth)).to be_persisted
      end
    end

    context "new admin" do
      let(:auth) { OmniAuth::AuthHash.new(
        provider: "google",
        uid: "1076060026507",
        info: {
          login: "Test Admin",
          email: "test_mail@gmail.com"
        }
     )}

      it "should register and sign in" do
        expect(Admin.from_omniauth(auth)).to be_new_record
      end
    end
  end
end
