require 'pry'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
  erb :home
end

get '/contact' do
  erb :contact
end

post '/contact' do
  # TODO: Use params data to send email to our sales team.
  erb :thankyou
end

get '/search' do
  "You searched for #{ params[:query] }. There are #{ rand(100) } results."
end

post '/subscribe' do
  "Thank you, your payment has been processed and we have all your money."
end
