require 'pry'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
  erb :home
end

get '/contact' do
  erb :contact
end

post '/processform' do
  binding.pry
end