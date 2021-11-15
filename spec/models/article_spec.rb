require 'rails_helper'

RSpec.describe Article, type: :model do
  describe "associations" do
    it { should belong_to(:category) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :title }
    it { is_expected.to validate_presence_of :description }
  end

  describe '.published' do
    let(:category) { 1 }
    context 'set published value true with date in the future' do

      let!(:article) { create(:article, category_id: category, published_at: Time.zone.now + 10.minutes) }

      it 'should return true for is_published column' do
        expect(article.published?).to be_falsy
      end
    end

    context 'set published value false with date in the past' do
      let!(:article) { create(:article, category_id: category, published_at: Time.zone.now - 10.minutes) }

      it 'should return false for is_published column' do
        expect(article.published?).to be_truthy
      end
    end
  end
end
