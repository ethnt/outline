class UserCreate < Mutations::Command
  required do
    hash :user do
      string :email
      string :password, nils: true
    end
  end

  def execute
    u = User.create(self.user)

    return u
  end
end
