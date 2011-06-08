DiceEnvy::Application.routes.draw do


  get "sign-up"     => "accounts#new",     :as => :sign_up
  get "sign-in"     => "sessions#new",     :as => :sign_in
  get "sign-out"    => "sessions#destroy", :as => :sign_out

  get "support"     => "pages#support",    :as => :support
  get "policy"      => "pages#policy",     :as => :policy
  get "terms"       => "pagespages#terms", :as => :terms
  get "jobs"        => "pages#jobs",       :as => :jobs
  get "about"       => "pages#about",      :as => :about
  get "contact"     => "pages#contact",    :as => :contact
  get "beta"        => "pages#beta",       :as => :beta

  resources :accounts
  resources :sessions

  root :to => "pages#beta"

end
