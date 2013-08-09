WildfyreSite::Application.routes.draw do
  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :projects do
    resources :comments 
  end

  resources :contacts
root :to => "main#index"
end
