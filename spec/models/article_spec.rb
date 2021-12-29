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
    let(:category) { create(:category) }
    context 'set published value true with date in the future' do

      let!(:article) { create(:article, category_id: category.id, published_at: Time.zone.now + 10.minutes) }

      it 'should return true for is_published column' do
        expect(article.published?).to be_falsy
      end
    end

    context 'set published value false with date in the past' do
      let!(:article) { create(:article, category_id: category.id, published_at: Time.zone.now - 10.minutes) }

      it 'should return false for is_published column' do
        expect(article.published?).to be_truthy
      end
    end
  end

  describe '.search' do
    let(:category) { create(:category) }

    context "valid params" do
      let!(:article_1) { create(:article, category_id: category.id, title: "Виховання дітей", age: "2 місяці", subject: "Вакцинація") }
      let!(:article_2) { create(:article, category_id: category.id, title: "Купання", age: "3 місяці", subject: "Прогулянка") }
      let!(:article_3) { create(:article, category_id: category.id, title: "Виховання дітей", age: "3 місяці", subject: "Сон") }

      it "search by title" do
        expect(category.articles.search(search: { title: "хов" })[0]).to eq(article_1)
      end

      it "search by age" do
        expect(category.articles.search(age: "3 місяці")[0]).to eq(article_2)
      end

      it "search by subject" do
        expect(category.articles.search(subject: "Сон")[0]).to eq(article_3)
      end
    end
  end
end
