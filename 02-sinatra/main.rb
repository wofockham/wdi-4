require 'pry'
require 'sinatra'
require 'sinatra/reloader'

set :server, 'webrick'

get '/' do
  "Hello World"
end

get '/hello' do
  "my first working web server"
end

get '/goodbye' do
  "so long and thanks etc"
end

get '/name/:somename' do
  "hello #{ params[:somename] }"
end

get '/name/:first/:last' do
  "hi there #{ params[:first] } #{ params[:last] }"
end

get '/name/:first/:last/:age' do
  "#{params[:first]} #{params[:last]} is #{params[:age]} years old"
end

get '/multiply/:x/:y' do
  result = params[:x].to_f * params[:y].to_f
  "the result of #{params[:x]} * #{params[:y]} is #{ result }"
end
