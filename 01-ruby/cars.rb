# Define a Car class. It should have attributes like max_speed, color, seating_material, etc.
# Define a few classes for different car makes/models
# For example define a Ferrari class with a high max_speed
# These classes should inherit from the Car class
# Instantiate several different cars objects

class Car
  attr_accessor :max_speed, :color, :seating_material
  def initialize
    @max_speed = 100
  end
end

class Ferrari < Car
  def initialize
    @max_speed = 200
    @color = 'red'
    @seating_material = 'leather'
  end
end

class Volkswagon < Car
  def initialize
    @max_speed = 80
    @color = 'garish'
    @seating_material = 'tiedye'
  end
end
