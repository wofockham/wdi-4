require 'sinatra'
require 'sinatra/reloader'
require 'pg'

get '/' do
  @courses = query_db('SELECT * FROM courses;')
  @students = query_db('SELECT * FROM students;')
  erb :home
end

get '/courses/:id' do
end

get '/students/:id' do
end

def query_db(sql)
  db = PG.connect(:dbname =>'students', :host => 'localhost')
  puts "SQL: #{ sql }"
  results = db.exec(sql)
  db.close
  results
end
