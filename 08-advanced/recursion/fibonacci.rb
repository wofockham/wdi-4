def fibonacci_i(n)
  a = 1
  fib = b = 1
  while (n > 2)
    fib = a + b
    a, b = b, fib
    n -= 1
  end
  fib
end

puts fibonacci_i(23)

def fibonacci_r(n)
  if (n <= 2)
    1
  else
    fibonacci_r(n - 1) + fibonacci_r(n - 2)
  end
end

puts fibonacci_r(20)
