Cookbook::Application.routes.draw do
  root :to => 'books#index'
  resources :books, :recipes, :ingredients
end
