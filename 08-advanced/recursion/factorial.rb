def factorial_i(n)
  product = 1
  while n > 1
    product = product * n
    n -= 1
  end

  product
end

def factorial_r(n)
  if (n > 1)
    n * factorial_r(n - 1)
  end
end

puts factorial_i 7
puts factorial_r 7