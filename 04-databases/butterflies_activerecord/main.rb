require 'sinatra'
require 'sinatra/reloader'
require 'pg'
require 'active_record'
#require 'protected_attributes'
require 'pry'

ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :host => "localhost",
  :port => 5432,
  :username => 'inceptor', #your postgres.app username
  :password => "",
  :database => "butterflies_app"
)
#ActiveRecord::Base.logger = Logger.new(STDOUT)

class Butterfly < ActiveRecord::Base
  attr_accessible :name, :family, :photo
end

before do
  @families = Butterfly.select(:family).distinct
end

get '/' do
  binding.pry
  erb :home
end

get '/butterflies' do
  @butterflies = Butterfly.all
  erb :butterflies
end

get '/butterflies/new' do
  erb :new_butterfly
end

post '/butterflies/create' do
  butterfly = Butterfly.new
  butterfly.name = params[:name]
  butterfly.family = params[:family]
  butterfly.photo = params[:photo]
  butterfly.save
  redirect to("/butterflies/#{ butterfly.id }")
end

post '/butterflies/update' do
  butterfly = Butterfly.find params[:id]
  butterfly.name = params[:name]
  butterfly.family = params[:family]
  butterfly.photo = params[:photo]
  butterfly.save
  redirect to("/butterflies/#{params[:id]}")
end

get '/butterflies/:id' do
  @butterfly = Butterfly.find params[:id]
  erb :butterfly
end

get '/butterflies/:id/edit' do
  @butterfly = Butterfly.find params[:id]
  erb :edit_butterfly
end

get '/butterflies/:id/delete' do
  butterfly = Butterfly.find params[:id]
  butterfly.destroy
  redirect to('/butterflies')
end

get '/butterflies/family/:family' do
  @butterflies = Butterfly.where(:family => params[:family])
  erb :butterflies
end

