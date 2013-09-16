require 'spec_helper'

describe NoteUpdate do
  let(:note) { create :note }
  let(:user) { note.user }
  let(:action) do
    NoteUpdate.run({
      current_user: user,
      note: {
        id:    note.id.to_s,
        title: 'Space',
        text:  note.text,
        tags: [
          'foo',
          'bar'
        ]
      }
    })
  end

  it { action.success?.should be_true }
  it { action.result.should be_an_instance_of Note }
  it { action.result.title.should eql 'Space' }
end
