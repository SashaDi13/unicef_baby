require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of :name }
  end

  describe "scope team" do
    let(:user) { User.first }
    it "find current user's team" do
      expect(User.team(user).count).to eq(2)
    end
  end
end
