require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'
require 'pry'

get '/' do
  erb :home
end

get '/butterflies' do
  db = SQLite3::Database.open('butterflies.db')
  @butterflies = db.execute('SELECT * FROM butterflies;')
  erb :butterflies
end

get '/butterflies/new' do
  erb :new_butterfly
end

post '/butterflies/create' do
  db = SQLite3::Database.open('butterflies.db')

  sql = "INSERT INTO butterflies (name, family, photo)
          VALUES ('#{params[:name]}', '#{params[:family]}', '#{params[:photo]}');"

  db.execute sql

  redirect to('/butterflies')
end
