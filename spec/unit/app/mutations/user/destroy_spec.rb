require 'spec_helper'

describe UserDestroy do
  let(:user) { create :user }
  let(:action) do
    UserDestroy.run({
      current_user: user,
      user: {
        id: user.id.to_s,
      }
    })
  end

  it { action.success?.should be_true }
  it { action.result.should be_nil }
end
