require 'pry'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
  erb :form
end

post '/' do
  f = File.new("receipt-#{ Time.now.to_i }.txt", 'a+')

  # Write each line to the file
  f.puts("")
  f.puts("- Company Name: #{ params[:company] }")
  f.puts("- Good/Service Provided: #{ params[:service] }")
  f.puts("- Cost: $#{ params[:cost] }")
  f.puts("- Thank you for your patronage")

  f.close

  erb :form
end