require 'sinatra'
require 'sinatra/reloader'
require 'json'

get '/' do
  erb :index
end

get '/random' do
  "<em>#{ rand(100).to_s }</em>"
end

get '/random.json' do
  # content_type :json
  { :word1 => "Hello", :number => rand(100) }.to_json
end

post '/greeter' do
  "thank you #{params[:first]} #{params[:surname]}"
end

