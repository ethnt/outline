Padrino.configure_apps do
  enable :sessions

  set :session_secret, '57763a04662c6aebd3f8e0361ebddeae2cb4b6ad8c63a7107691dc47c80bd930'
end

Padrino.mount('Outline::Web', app_file: Padrino.root('app/app.rb')).to('/')
