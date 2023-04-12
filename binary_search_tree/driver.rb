require_relative "./bst"

# Generate random array
def random_array(length)
  return [] if length <= 0 || !length.is_a?(Integer)
  arr = []
  length.times { arr.push(rand(100)) }
  arr
end

# Set up
tree = BinaryTree.new(random_array(20))

# Tests
puts tree.is_balanced

puts tree.level_order
puts tree.in_order
puts tree.pre_order
puts tree.post_order

tree.insert_value(300)
tree.insert_value(400)
tree.insert_value(500)

puts tree.is_balanced
tree.rebalance
puts tree.is_balanced

puts tree.level_order
puts tree.in_order
puts tree.pre_order
puts tree.post_order

tree.pretty_print
