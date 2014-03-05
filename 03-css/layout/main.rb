require 'pry'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
  erb :home
end

get '/contact' do
  erb :contact
end

get '/news' do
  erb :news
end

get '/gossip' do
  erb :gossip
end