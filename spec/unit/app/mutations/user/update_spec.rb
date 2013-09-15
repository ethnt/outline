require 'spec_helper'

describe UserUpdate do
  let(:user) { create :user }
  let(:action) do
    UserUpdate.run({
      current_user: user,
      user: {
        id: user.id.to_s,
        email: 'foo@bar.com',
        password: 'barfoo'
      }
    })
  end

  it { action.success?.should be_true }
  it { action.result.should be_an_instance_of User }
  it { action.result.email.should eql 'foo@bar.com' }
end
