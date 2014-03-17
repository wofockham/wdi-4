Basics::Application.routes.draw do
  root :to => 'pages#home'

  get '/home' => 'pages#home'
  get '/about' => 'pages#about'
  get '/faq' => 'pages#faq'
  get '/funny' => 'pages#lol'

  get '/butterflies' => 'butterflies#index'
  get '/butterflies/new' => 'butterflies#new'
  get '/butterflies/faq' => 'butterflies#faq'

  get '/auto/:color' => 'auto#color'
  get '/auto/:hp/:torque' => 'auto#engine'

  get '/calc/:x/:y/:operator' => 'calc#calculate'

end

