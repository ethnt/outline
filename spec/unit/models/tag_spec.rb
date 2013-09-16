require 'spec_helper'

describe Tag do
  let(:tag) { create :tag }

  it { should validate_presence_of :text }

  it { tag.should be_valid }
end
