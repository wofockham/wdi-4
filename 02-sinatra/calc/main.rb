require 'pry'
require 'sinatra'
require 'sinatra/reloader'

get '/calc' do
  erb :calc
end

get '/result' do
  binding.pry
end

get '/calc/multiply/:x/:y' do
  @result = params[:x].to_f * params[:y].to_f
  erb :multiply
end

get '/calc/add/:x/:y' do
  @result = params[:x].to_f + params[:y].to_f
  erb :add
end
