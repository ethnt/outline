require 'spec_helper'

describe NoteDestroy do
  let(:note) { create :note }
  let(:user) { note.user }
  let(:action) do
    NoteDestroy.run({
      current_user: user,
      note: {
        id: note.id.to_s
      }
    })
  end

  it { action.success?.should be_true }
  it { action.result.should be_nil }
end
