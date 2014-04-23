Integrated::Application.routes.draw do

  root :to => "home#index"
  get "/countries/:step/:offset" => "home#countries"
  get "/countries" => "home#countries"
  get "/country/:id" => "home#country"

end
