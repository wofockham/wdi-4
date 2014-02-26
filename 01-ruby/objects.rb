class Person
  def speak
    puts "Good morning"
  end

  def talk(words_to_say)
    puts "I like saying #{words_to_say}"
  end

  def age=(age)
    @age = age
  end

  def age
    @age
  end
end

