FirstApp::Application.routes.draw do
  #devise_for :users

  get "users/index"

  get "user/index"

  resources :splashes


  get "home/index"

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

   resources :entries

   resources :trials

   resources :splash
   resources :users

  match '/entries/update' => 'entries#update'

   match '/entries/delete' => 'entries#delete'
   match '/trials/change' => 'trials#change'
   match '/trials/:id/change_trial' => 'trials#change_trial'

   match '/splashes' => 'splashes#index'

   root :to => 'splashes#index'

   match '/' => "home#index", :as => :home
   match '/users/:id/activate' => 'users#activate', as: :users_activate

   match '/insert_trials' => 'home#insert_trials', :as => 'insert_trials'
   match '/register' => 'home#register'
   match '/login' => 'home#login'
   match '/invite' => 'home#invite'
   match '/removeFriend' => 'home#removeFriend'
   match '/logout' => 'home#logout'
   match '/faq' => 'static#faq'
   match '/join' => 'trials#join'
   match '/directory' => 'users#index'
   match '/loginError' => 'static#loginError'
   match '/forgotPassword' => 'home#forgotPassword'


end
