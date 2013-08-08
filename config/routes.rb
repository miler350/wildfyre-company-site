WildfyreSite::Application.routes.draw do
  devise_for :users
  resources :projects
root :to => "main#index"
end
