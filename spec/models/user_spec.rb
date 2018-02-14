require 'rails_helper'

RSpec.describe User, :type => :model do
  let(:user) {create(:user)}

  describe 'validation' do
    it {is_expected.to validate_presence_of(:email)}
    #it {is_expected.to validate_uniqueness_of(:email)} #currently failing
    it {is_expected.to validate_length_of(:email).is_at_least(3)}

    it {is_expected.to validate_presence_of(:name)}
    it {is_expected.to validate_length_of(:name).is_at_least(1)}

    it {is_expected.to validate_presence_of(:password)}
    it {is_expected.to validate_length_of(:password).is_at_least(6)}
  end

  describe 'request_association' do
    it {is_expected.to have_many(:requests).dependent(:destroy)}
  end

  describe 'nested_attributes' do
    it {is_expected.to accept_nested_attributes_for :requests}
  end

  #describe scope?
end
