Animanga::Application.routes.draw do

  resources :mensajepersonals do
    member do
      get :reply
      post :save_reply
    end
  end
  resources :puntajes

  resources :comments

  resources :boards do
    resources :conversations do
      member do
        get :reply
        post :save_reply
      end
    end
  end
  root to: 'boards#index', as: 'homepage'

  resources :users
  resources :user_sessions
  resources :mensajepersonals

  match 'login' => 'user_sessions#new', as: :login
  match 'logout' => 'user_sessions#destroy', as: :logout

  match 'conversation/votar/:comentario_id' => 'comments#votar', as: 'votar_encuesta'

  get '/enviados' => "mensajepersonals#enviados", as: :enviados
  get '/recibidos' => "mensajepersonals#recibidos", as: :recibidos

end