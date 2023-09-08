require 'rails_helper'

describe User, type: :model do
  describe 'validations' do
    subject { build(:user) }
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_uniqueness_of(:email) }
  end
end
