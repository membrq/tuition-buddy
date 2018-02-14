require 'rails_helper'

RSpec.describe Request, :type => :model do
  let(:request) {create(:request)}

  describe 'user_association' do
    it {is_expected.to belong_to(:user)}
  end

  describe 'validation' do
    it {is_expected.to validate_presence_of(:user_id)}
  end

  #test scope?
end
