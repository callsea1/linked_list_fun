#!/usr/bin/ruby

class LinkedListNode
  attr_accessor :value, :next_node

  def initialize(value, next_node=nil)
    @value = value
    @next_node = next_node
  end
end


def reverse_list(list, previous=nil)
	
  while list
    current_node = list
    next_node = current_node.next_node
    current_node.next_node = previous
    list = next_node
    previous = current_node
  end

  return current_node
end


def print_values(list_node)
  print "#{list_node.value} --> "
  if list_node.next_node.nil?
    print "nil\n"
    return
  else
    print_values(list_node.next_node)
  end
end

#if it is not infinite it will print the numbers, if it is, it won't
def is_infinite_ll(list)
  if list.nil? 
    return false
  end
  turtle = list
  rabbit = list.next_node
  while rabbit
    if rabbit == turtle 
      puts "infinite man"
      return true
    elsif rabbit.next_node.nil? 
      puts "not infinite"
      print_values(list)
      return false
    else 
      turtle = turtle.next_node
      rabbit = rabbit.next_node.next_node
    end
  end
  puts "not infinite"
  print_values(list)
  return false
end

node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)

#comment this line out to see it perform on a non-infinite ll
node1.next_node = node3

is_infinite_ll(node3)