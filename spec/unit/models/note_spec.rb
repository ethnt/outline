require 'spec_helper'

describe Note do
  let(:note)  { create :note }
  let(:user)  { note.user }
  let(:other) { create :user }

  it { should validate_presence_of :title }

  it { note.should be_valid }

  describe '#viewable_by?' do
    it { note.viewable_by?(user).should be_true }
    it { note.viewable_by?(other).should be_false }
  end

  describe '#updatable_by?' do
    it { note.updatable_by?(user).should be_true }
    it { note.updatable_by?(other).should be_false }
  end

  describe '#destroyable_by?' do
    it { note.destroyable_by?(user).should be_true }
    it { note.destroyable_by?(other).should be_false }
  end
end
