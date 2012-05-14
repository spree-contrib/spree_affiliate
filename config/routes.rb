Spree::Core::Engine.routes.prepend do
  namespace :admin do
    resource :affiliate_settings
  end

  resources :affiliates, :only => [:show, :index]
end
