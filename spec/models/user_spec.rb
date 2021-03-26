require 'rails_helper'

describe User, type: :model do
  it do
    should validate_presence_of(:first_name)
  end

  it do
    should validate_presence_of(:last_name)
  end

  it do
    should validate_presence_of(:password)
  end

  it do
    should validate_presence_of(:password_confirmation)
  end

  it do
    should validate_presence_of(:email)
  end

  context 'When user is created' do
    subject(:user) do
      build(:user)
    end
    it do
      is_expected.to be_valid
    end
  end

  describe '#create' do
    context 'When the first_name is nil' do
      subject(:user) do
        build(:user, first_name: nil)
      end
      it do
        is_expected.to be_invalid
      end
    end

    context 'When last_name is nil' do
      subject(:user) do
        build(:user, last_name: nil)
      end
      it do
        is_expected.to be_invalid
      end
    end

    context 'When password is nil' do
      subject(:user) do
        build(:user, password: nil)
      end
      it do
        is_expected.to be_invalid
      end
    end

    context 'When password_confirmation is nil' do
      subject(:user) do
        build(:user, password_confirmation: nil)
      end
      it do
        is_expected.to be_invalid
      end
    end

    context 'When email is nil' do
      subject(:user) do
        build(:user, email: nil)
      end

      it do
        is_expected.to be_invalid
      end
    end
  end
end
