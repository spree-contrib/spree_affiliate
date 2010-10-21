Rails.application.routes.draw do
  namespace :admin do
    resource :affiliate_settings
  end
  
  resources :affiliates, :only => [:show, :index]
end
