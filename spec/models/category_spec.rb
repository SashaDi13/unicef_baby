require 'rails_helper'

RSpec.describe Category, type: :model do

  describe "name" do
    context "associations" do
      it { is_expected.to have_many(:articles) }
    end

    context 'validations' do
      it { is_expected.to validate_presence_of :name }
    end

    context "when category name is already taken" do
      let(:category) { :add }
      let(:name) { category.name }
      it { is_expected.to be_invalid }
    end
  end
end
