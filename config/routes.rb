Animanga::Application.routes.draw do
  resources :usuario_cancions

  resources :animes

  resources :cancions

  resources :mensajepersonals

  resources :puntajes

  resources :comments

  resources :boards do
    resources :conversations
  end
  root :to => 'boards#index', :as => 'homepage'
  #root :to => 'boards#index'

  resources :users
  resources :user_sessions
  resources :mensajepersonals

  match 'login' => 'user_sessions#new', :as => :login
  match 'logout' => 'user_sessions#destroy', :as => :logout

  match 'conversation/votar/:comentario_id' => 'comments#votar', as: 'votar_encuesta'
  match 'mis_canciones' => 'usuario_cancions#index', as: 'mis_canciones'


  get '/enviados' => "mensajepersonals#enviados", :as=> :enviados
  get '/recibidos' => "mensajepersonals#recibidos", :as=> :recibidos

  get '/boards/:board_id/conversations/:id/reply' => "conversations#reply", :as => :reply_board_conversation
  post '/boards/:board_id/conversations/:id/reply' => "conversations#save_reply", :as => :reply_board_conversation


  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
