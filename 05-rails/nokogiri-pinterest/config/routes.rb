NokogiriPinterest::Application.routes.draw do
  get "pinterest/show"
  root :to => 'pages#index'
  get '/pinterest' => 'pinterest#show'
end

