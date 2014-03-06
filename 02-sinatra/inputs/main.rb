require 'pry'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
  erb :form
end

post '/' do
  binding.pry
end
