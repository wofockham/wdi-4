# Displays a menu and lets the user select their calculator mode.
def menu
  puts "Please select your calculator:"
  puts "1. Basic calculator"
  puts "2. Advanced calculator"

  choice = gets.chomp.to_i
  while (choice != 1 && choice != 2)
    puts "Please select 1 or 2."
    choice = gets.chomp.to_i
  end

  case choice
  when 1
    basic_calculator
  when 2
    advanced_calculator
  end
end

# Displays basic calculator operations, reads a choice and two numbers.
def basic_calculator
  puts "Welcome to the basic calculator"
  puts "Please select your operation"
  puts "(a) - addition"
  puts "(s) - subtraction"
  puts "(d) - division"
  puts "(m) - multiplication"

  operation = gets.chomp
  puts "Enter your first number"
  num1 = gets.chomp.to_f
  puts "Enter your second number"
  num2 = gets.chomp.to_f

  case operation
  when 'a'
    add num1, num2
  when 's'
    subtract num1, num2
  when 'd'
    divide num1, num2
  when 'm'
    multiply num1, num2
  end
end

def advanced_calculator
  puts "Welcome to the advanced calculator"
end

def add(x, y)
  puts "#{ x } + #{ y } = #{ x + y }"
end

def subtract(x, y)
  puts "#{ x } - #{ y } = #{ x - y }"
end

def multiply(x, y)
  puts "#{ x } * #{ y } = #{ x * y }"
end

def divide(x, y)
  puts "#{ x } / #{ y } = #{ x / y }"
end

while true
  menu()
end
