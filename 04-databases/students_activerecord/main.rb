require 'sinatra'
require 'sinatra/reloader'
require 'pg'
require 'pry'
#require 'active_support/all'
require 'logger'
require 'active_record'
# require 'protected_attributes'

ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :host => "localhost",
  :port => 5432,
  :pool => 8,
  :username => 'inceptor', #your postgres.app username
  :password => "",
  :database => "students"
)
ActiveRecord::Base.logger = Logger.new(STDOUT)

class Student < ActiveRecord::Base
  has_and_belongs_to_many :courses
end

class Course < ActiveRecord::Base
  has_and_belongs_to_many :students
end

get '/' do
  @courses = Course.all
  @students = Student.all
  erb :home
end

get '/courses/:id' do
  @course = Course.find params[:id]
  erb :course
end

get '/students/:id' do
  @student = Student.find params[:id]
  erb :student
end

