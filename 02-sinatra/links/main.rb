require 'pry'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
  f = File.open('links.csv', 'r')
  @links = []
  f.each do |line|
    parts = line.split(',')
    @links.push({
      :url => parts[0],
      :text => parts[1] || parts[0]
    })
  end

  f.close

  erb :links
end
