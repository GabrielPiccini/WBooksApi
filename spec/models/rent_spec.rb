require 'rails_helper'

describe Rent, type: :model do
  it do
    should validate_presence_of(:user)
  end

  it do
    should validate_presence_of(:book)
  end

  it do
    should validate_presence_of(:from)
  end

  it do
    should validate_presence_of(:to)
  end

  context 'When rent is created' do
    subject(:rent) do
      create(:rent, user: create(:user), book: create(:book))
    end
    it do
      is_expected.to be_valid
    end
  end

  describe '#create' do
    context 'When the user is nil' do
      subject(:rent) do
        build(:rent, user: nil)
      end
      it do
        is_expected.to be_invalid
      end
    end

    context 'When the book is nil' do
      subject(:rent) do
        build(:rent, book: nil)
      end
      it do
        is_expected.to be_invalid
      end
    end

    context 'When from is nil' do
      subject(:rent) do
        build(:rent, from: nil)
      end
      it do
        is_expected.to be_invalid
      end
    end

    context 'When to is nil' do
      subject(:rent) do
        build(:rent, to: nil)
      end
      it do
        is_expected.to be_invalid
      end
    end
  end
end
