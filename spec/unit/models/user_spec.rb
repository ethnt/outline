require 'spec_helper'

describe User do
  let(:user)  { create :user }
  let(:other) { create :user }

  it { should validate_presence_of :email }

  it { should allow_value('a@b.com').for(:email) }
  it { should_not allow_value('a').for(:email) }

  it { user.should be_valid }

  describe '.authenticate' do
    let(:action) do
      User.authenticate(user.email, 'foobar')
    end

    it { action.should be_an_instance_of User }
    it { action.should eql user }
  end

  describe '#generate_access_token!' do
    it { user.access_token.should_not be_nil }
  end

  describe '#viewable_by?' do
    it { user.viewable_by?(user).should be_true }
    it { user.viewable_by?(other).should be_false }
  end

  describe '#updatable_by?' do
    it { user.updatable_by?(user).should be_true }
    it { user.updatable_by?(other).should be_false }
  end

  describe '#destroyable_by?' do
    it { user.destroyable_by?(user).should be_true }
    it { user.destroyable_by?(other).should be_false }
  end
end
