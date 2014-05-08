def countdown(num)
  puts num
  if (num > 0)
    countdown(num - 1)
  else
    puts "Blastoff"
  end
end

countdown(10)

def a
  b
end

def b
  a
end

def infinite_method
  infinite_method
end

#infinite_method()
a()
