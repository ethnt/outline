class UserUpdate < Mutations::Command
  required do
    model :current_user, class: User
    hash  :user do
      string :id
      string :email
      string :password
    end
  end

  def execute
    u = User.find(self.user['id'])

    if current_user.can_update?(u)
      u.update_attributes(self.user)
      u.save

      return u
    else
      add_error(:current_user, :unauthorized, 'not authorized')
    end
  end
end
