require 'rails_helper'
require 'cancan/matchers'

describe "User" do
  describe "Abilities" do
    #let(:admin){create(:admin)}
    subject(:ability) {Ability.new(user)}
    let(:user){ nil }

    context 'when user is not signed in' do
      #it {should be_able_to(:index, Welcome)}
      it {should_not be_able_to(:manage, :any)}
    end

    context 'when user is signed in' do
      let(:user) {create(:user)}

      context 'when user is admin' do
        it {should be_able_to(:manage, :all)}
      end

      context 'when user is not admin' do
        #let(:admin){ create(:user, is_admin: true)}

        it {should be_able_to(:read, :all)}
        it {should_not be_able_to(:manage, :all)}
      end
    end
  end
end
