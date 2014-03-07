require 'pry'
require 'sinatra'
require 'sinatra/reloader'

get '/hello' do
  "hello world"
end

get '/students/:first_name' do
  @student_name = params[:first_name]
  erb :student # <%= @student_name %> || <%= params[:first_name] %>
end

get '/form' do
  erb :form
end

get '/action' do
  binding.pry
end

post '/action' do
  binding.pry
end

