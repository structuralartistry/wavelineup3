Wavelineup3::Application.routes.draw do

  resources :reports
  match 'reports' => 'reports#index', :as => 'reports'
  match 'reports/show' => 'reports#show', :as => 'show_report'

  resources :feature_requests

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

  resources :logins
  match 'login' => 'logins#new', :as => 'login'
  match 'logout' => 'logins#destroy', :as => 'logout'
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

  root :to => "home#index"
end
