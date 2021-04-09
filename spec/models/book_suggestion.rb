require 'rails_helper'

describe BookSuggestion, type: :model do
  it do
    should validate_presence_of(:author)
  end

  it do
    should validate_presence_of(:title)
  end

  it do
    should validate_presence_of(:link)
  end

  context 'When book suggestion is created' do
    subject(:book_suggestion) do
      create(:book_suggestion)
    end

    it do
      is_expected.to be_valid
    end
  end

  describe '#create' do
    context 'When the author is nil' do
      subject(:book_suggestion) do
        build(:book_suggestion, author: nil)
      end

      it do
        is_expected.to be_invalid
      end
    end

    context 'When the title is nil' do
      subject(:book_suggestion) do
        build(:book_suggestion, title: nil)
      end

      it do
        is_expected.to be_invalid
      end
    end

    context 'When link is nil' do
      subject(:book_suggestion) do
        build(:book_suggestion, link: nil)
      end

      it do
        is_expected.to be_invalid
      end
    end
  end
end
