Draft::Web.helpers do
  def current_user
    User.find(session[:draft])
  end
end
