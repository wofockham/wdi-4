class Node
  attr_accessor :value, :next

  def initialize(value=nil)
    @value = value
    @next = nil
  end

  def to_s
    @value
  end
end

class SinglyLinkedList
  attr_accessor :head

  def initialize(first_value=nil)
    @head = Node.new(first_value) if first_value
  end

  def prepend(value)
    node = Node.new(value)
    node.next = @head
    @head = node
  end

  # Inserts new_node AFTER node.
  def insertAfter(node, new_node)
  end

  # Inserts a new node with value at the end of the linked list.
  def append(value)
  end

  # Removes the first node // kind of like shift()
  def remove
  end

  # Returns the last node.
  def last
  end

  # Returns the length of the linked list.
  def length
  end

  # Returns the node with the value of needle.
  def find(needle)
  end

  # Returns a new singly linked list with the nodes in reverse order
  def reverse
  end

  # Reverses the list's nodes in place (does not return a copy)
  def reverse!
  end
end
