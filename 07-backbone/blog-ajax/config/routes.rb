BlogAjax::Application.routes.draw do
  get '/posts/:id/comments' => 'posts#comments'
  resources :posts
  root :to => 'posts#landing'
end
