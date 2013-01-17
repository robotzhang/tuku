Tuku::Application.routes.draw do
  root :to => 'application#homepage'
  get 'albums/:seo_url' => 'albums#show'
  resources :albums
  match 'login' => 'users#login'
  match 'logout' => 'users#destroy'
  match 'signup' => 'users#new'
  resource :users
  get 'admin' => 'application#admin'
  namespace :admin do |admin|
    resources :albums do
      resource :images
    end
    resources :images
  end
end
