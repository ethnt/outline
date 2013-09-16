class NoteDestroy < Mutations::Command
  required do
    model :current_user, class: User
    hash  :note do
      string :id
    end
  end

  def execute
    n = Note.find(note['id'])

    if current_user.can_destroy?(n)
      n.delete

      return nil
    else
      add_error(:current_user, :unauthorized, 'not authorized')
    end
  end
end
