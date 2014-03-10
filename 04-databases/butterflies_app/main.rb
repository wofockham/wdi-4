require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'

get '/' do
  erb :home
end

get '/butterflies/new' do
  erb :new_butterfly
end

post '/butterflies/create' do

end