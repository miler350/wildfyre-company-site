WildfyreSite::Application.routes.draw do
  devise_for :users
  resources :projects
  resources :contacts
root :to => "main#index"
end
