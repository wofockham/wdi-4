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
  include Enumerable
  attr_accessor :head

  def initialize(first_value=nil)
    @head = Node.new(first_value) if first_value
  end

  def each(&block)
    node = @head
    while node
      block.call(node.value)
      node = node.next
    end
    self
  end

  def prepend(value)
    node = Node.new(value)
    node.next = @head
    @head = node
  end

  # Inserts new_node AFTER node.
  def insertAfter(node, new_node)
    new_node.next = node.next
    node.next = new_node
  end

  # Inserts a new node with value at the end of the linked list.
  def append(value)
    last.next = Node.new(value)
  end

  # Removes the first node // kind of like shift()
  def remove
    @head = @head.next
  end

  # Returns the last node.
  def last
    node = @head
    node = node.next while (node.next)
    node
  end

  # Returns the length of the linked list.
  def length
    return 0 unless node = @head
    i = 1
    while (node.next)
      i += 1
      node = node.next
    end
    i
  end

  # Returns the node with the value of needle.
  def find(needle)
    node = @head
    while node
      return node if node.value == needle
      node = node.next
    end
    return node
  end

  # Returns a new singly linked list with the nodes in reverse order
  def reverse
    reversed = SinglyLinkedList.new
    node = @head
    while (node)
      reversed.prepend Node.new(node.value)
      node = node.next
    end
    reversed
  end

  # Reverses the list's nodes in place (does not return a copy)
  def reverse!
    @head = reverse.head
  end
end

require 'pry'
binding.pry
