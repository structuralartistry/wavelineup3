Wavelineup3::Application.routes.draw do


  resources :visits

  match 'practice_room/:id/:visible_section/:visit_id' => 'practice_room#main'
  match 'practice_room/:id/:visible_section' => 'practice_room#main'

  match 'activations/resend/:activation_code' => 'activations#resend', :as => 'resend_activation'
  match 'activations/:activation_code' => 'activations#create', :as => 'activations'

  resources :feedback_supports

  resources :invitations

  resources :travel_cards

  resources :practice_members

  resources :practices
  match 'register' => 'practices#new', :as => 'register'
  match 'register_referred/:token' => 'practices#new', :as => 'register_referred'
  match 'confirm_delete_practice' => 'practices#confirm_delete', :as => 'confirm_delete_practice'
  match 'export_practice' => 'practices#export', :as => 'export_practice'

  match 'login' => 'user_sessions#new', :as => 'login'
  match 'logout' => 'user_sessions#destroy', :as => 'logout'
  match 'user_profile' => 'users#edit', :as => 'user_profile'

  match 'reset_password' => 'password_resets#new', :as => 'reset_password'

  resources :password_resets
  resources :user_sessions
  match 'internet_explorer' => 'user_sessions#internet_explorer', :as => 'internet_explorer'

  resources :users

  match 'home' => 'home#index', :as => 'home'
  match 'terms_of_service' => 'home#terms_of_service', :as => 'terms_of_service'
  match 'privacy_policy' => 'home#privacy_policy', :as => 'privacy_policy'
  match 'about' => 'home#about', :as => 'about'

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
  root :to => "home#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
