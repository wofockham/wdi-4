Contact::Application.routes.draw do
  root :to => 'pages#index'
  get '/contact' => 'pages#contact'
  post '/contact' => 'pages#sendemail'
end
