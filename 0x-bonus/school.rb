class School
  attr_reader :db
  def initialize(school_name)
    @school_name = school_name
    @db = {}
  end

  def add(student_name, grade)
    grade = grade.to_s
    @db[grade] ||= [] # Equivalent to: @db[grade] = @db[grade] || []
    @db[grade] << student_name
  end

  def grade(grade)
    @db[grade.to_s] || []
  end

  def sort
    # Sort students in each grade alphabetically.
    @db.each do |grade, students|
      students.sort!
    end

    @db.sort # Return an array version of our db hash, sorted by grade in ascending order.
  end
end

# Testing...
school = School.new("Haleakala Hippy School")
puts school
puts school.db

school.add("XXJames", 2)
puts school.db.inspect

school.add("Phil", 2)
school.add("Jennifer", 3)
school.add("Little Billy", 1)
puts school.db.inspect

puts school.grade(2).inspect
puts school.sort.inspect

school.grade(2).each do |student|
  puts "Our school welcomes #{student}"
end
