Draft::Web.controllers do
  get :index do
    if current_user
      @notes = Note.where(user_id: current_user).desc(:updated_at).all

      render 'core/dashboard'
    else
      render 'core/index', layout: false
    end
  end
end
