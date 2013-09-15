require 'spec_helper'

describe UserCreate do
  let(:action) do
    UserCreate.run({
      user: {
        email:    'bar@foo.com',
        password: 'barfoo'
      }
    })
  end

  it { action.success?.should be_true }
  it { action.result.should be_an_instance_of User }
  it { action.result.email.should eql 'bar@foo.com' }
end
