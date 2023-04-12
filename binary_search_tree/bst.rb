class Node
  attr_accessor :data, :left, :right

  def initialize(data, left = nil, right = nil)
    @data = data
    @left = left
    @right = right
  end
end

class BinaryTree
  attr_accessor :root

  def initialize(arr)
    @root = build_tree(arr)
  end

  def build_tree(arr)
    return nil if arr.empty?
    arr = arr.uniq.sort
    mid = arr.length / 2
    root = Node.new(arr[mid])
    root.left = build_tree(arr[0...mid])
    root.right = build_tree(arr[mid+1..-1])
    root
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    if node.right
      pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false)
    end
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    if node.left
      pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true)
    end
  end

  def insert_value(root, value)
    return Node.new(value) if root.nil?
    if value < root.data
      root.left = insert_value(root.left, value)
    elsif value > root.data
      root.right = insert_value(root.right, value)
    end
    root
  end

  def delete_value(root, value)
    return nil if root.nil?
    if value < root.data
      root.left = delete_value(root.left, value)
    elsif value > root.data
      root.right = delete_value(root.right, value)
    else
      if root.left.nil? && root.right.nil?
        return nil
      elsif root.left.nil?
        return root.right
      elsif root.right.nil?
        return root.left
      else
        min_value = find_min_value(root.right)
        root.data = min_value
        root.right = delete_value(root.right, min_value)
      end
    end
    root
  end

  def find_min_value(root)
    while root.left
      root = root.left
    end
    root.data
  end

  def level_order(root = @root, &block)
    return if root.nil?
    queue = [root]
    while !queue.empty?
      node = queue.shift
      block.call(node) if block_given?
      queue << node.left if node.left
      queue << node.right if node.right
    end
  end

  def in_order(root = @root, &block)
    return if root.nil?
    in_order(root.left, &block)
    block.call(root) if block_given?
    in_order(root.right, &block)
  end

  def pre_order(root = @root, &block)
    return if root.nil?
    block.call(root) if block_given?
    pre_order(root.left, &block)
    pre_order(root.right, &block)
  end

  def post_order(root = @root, &block)
    return if root.nil?
    post_order(root.left, &block)
    post_order(root.right, &block)
    block.call(root) if block_given?
  end

  def height(node)
    return -1 if node.nil?
    [height(node.left), height(node.right)].max + 1
  end

  def depth(node, value)
    return -1 if node.nil?
    return 0 if node.data == value
    left = depth(node.left, value)
    return left + 1 if left != -1
    right = depth(node.right, value)
    return right + 1 if right != -1
    return -1
  end
    
  def is_balanced(root)
    return true if root.nil?
    left_height = height(root.left)
    right_height = height(root.right)
    if (left_height - right_height).abs <= 1 &&
      is_balanced(root.left) && is_balanced(root.right)
      return true
    end
    return false
  end
    
  def re_balance(root)
    values = []
    in_order(root) { |node| values.push(node.data) }
    return build_tree(values)
  end
    
  return {
    root: root,
    build_tree: method(:build_tree),
    pretty_print: method(:pretty_print),
    insert_value: method(:insert_value),
    delete_value: method(:delete_value),
    level_order: method(:level_order),
    in_order: method(:in_order),
    pre_order: method(:pre_order),
    post_order: method(:post_order),
    height: method(:height),
    depth: method(:depth),
    is_balanced: method(:is_balanced),
    re_balance: method(:re_balance)
  }
end
