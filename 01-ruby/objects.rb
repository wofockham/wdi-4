class Animal
  def speak
    puts "I am an animal"
  end

  def move
    puts "I can move"
  end
end

class Mammal < Animal
  def eat
    puts "I can eat nom nom nom"
  end
  def speak(action)
    puts action
    puts "I can speak"
  end
end

class Monkey < Mammal
  def swing
    puts "I can swing"
  end
  def speak(action)
    super
    puts "HoWwOo WHoWo"
  end
end

class Dog < Mammal
  def speak
    super("vomit")
    puts "Woof"
  end
end

class Person < Animal
  attr_accessor :age, :name, :gender, :shoesize
  def initialize(age, gender, name)
    @age = age
    @gender = gender
    @name = name
  end

  def to_s
    "#{@name} is a #{gender} of #{age} years. This code is bug free."
  end

  def Person.eye_count
    2
  end
end


