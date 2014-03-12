require 'sinatra'
require 'sinatra/reloader'
require 'pg'
require 'active_record'
#require 'protected_attributes'
require 'pry'

ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :host => "localhost",
  :username => 'inceptor', #your postgres.app username
  :password => "",
  :database => "butterflies_app"
)

class Butterfly < ActiveRecord::Base
  attr_accessible :name, :family, :photo
end

before do
  @families = query_db('SELECT DISTINCT family FROM butterflies;')
end

get '/' do
  binding.pry
  erb :home
end

get '/butterflies' do
  @butterflies = query_db('SELECT * FROM butterflies;')
  erb :butterflies
end

get '/butterflies/new' do
  erb :new_butterfly
end

post '/butterflies/create' do
  sql = "INSERT INTO butterflies (name, family, photo)
          VALUES ('#{params[:name]}', '#{params[:family]}', '#{params[:photo]}');"
  query_db(sql)
  redirect to('/butterflies')
end

post '/butterflies/update' do
  sql = "UPDATE butterflies SET
    name='#{params[:name].gsub("'", "''")}',
    family='#{params[:family].gsub("'", "''")}',
    photo='#{params[:photo].gsub("'", "''")}' WHERE id=#{params[:id]}"
  query_db(sql)
  redirect to("/butterflies/#{params[:id]}")
end

get '/butterflies/:id' do
  results = query_db("SELECT * FROM butterflies WHERE id=#{ params[:id] }")
  @butterfly = results.first
  erb :butterfly
end

get '/butterflies/:id/edit' do
  results = query_db("SELECT * FROM butterflies WHERE id=#{ params[:id] }")
  @butterfly = results.first
  erb :edit_butterfly
end

get '/butterflies/:id/delete' do
  query_db("DELETE FROM butterflies WHERE id=#{ params[:id] }")
  redirect to('/butterflies')
end

get '/butterflies/family/:family' do
  @butterflies = query_db("SELECT * FROM butterflies WHERE family ILIKE '#{params[:family]}'")
  erb :butterflies
end

def query_db(sql)
  db = PG.connect(:dbname =>'butterflies_app', :host => 'localhost')
  puts "SQL: #{ sql }"
  results = db.exec(sql)
  db.close
  results
end
