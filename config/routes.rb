Rails.application.routes.draw do
  resources :links, :path => '/' do
    collection do
      get :landing
    end
  end
end
