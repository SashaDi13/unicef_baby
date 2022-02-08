require 'rails_helper'

RSpec.describe Document, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of :title }
  end

  describe '.thumbable?' do
    context "file content type is allowed" do
      let(:document) { create(:document, file: File.open("spec/files/documents/4.pdf")) }
      it 'should be true' do
        expect(document.thumbable?).to be_truthy
      end
    end

    context "file content type is not allowed" do
      let(:document) { create(:document, file: File.open("spec/files/documents/5.xlsx")) }
      it 'should be false' do
        expect(document.thumbable?).to be_falsy
      end
    end
  end
end
