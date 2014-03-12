require 'sinatra'
require 'sinatra/reloader'
require 'pg'
require 'pry'

class Student
  attr_accessor :first_name, :age, :gender

  def initialize(first_name, age, gender)
    @first_name = first_name
    @age = age
    @gender = gender
  end
end


before do
  $db = PG.connect(:dbname =>'students', :host => 'localhost')
end

after do
  $db.close if $db # Good housekeeping.
end

get '/' do
  @courses = query_db('SELECT * FROM courses;')
  @students = query_db('SELECT * FROM students;')
  erb :home
end

get '/courses/:id' do
  @course = query_db("SELECT * FROM courses WHERE id=#{ params[:id] }").first
  @students = query_db("SELECT * FROM students WHERE id IN (
                          SELECT student_id FROM courses_students WHERE course_id=#{ params[:id]}
                        )")
  erb :course
end

get '/students/:id' do
  student_data = query_db("SELECT * FROM students WHERE id=#{ params[:id] }").first
  @student = Student.new(student_data['first_name'], student_data['age'], student_data['gender'])

  @courses = query_db("SELECT * FROM courses WHERE id IN (
                        SELECT course_id FROM courses_students WHERE student_id=#{params[:id]}
                       )")
  erb :student
end

def query_db(sql)
  puts "SQL: #{ sql }"
  $db.exec(sql)
end
