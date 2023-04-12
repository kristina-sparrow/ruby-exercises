def create_node(value = nil, next_node = nil)
  { value: value, next: next_node }
end

def linked_list
  head = nil
  tail = nil
  length = 0

  # add a new node containing value to the end of the list
  def append(value)
    new_node = create_node(value)
    length += 1
    if head.nil?
      self.head = new_node
      self.tail = new_node
    else
      tail[:next] = new_node
      self.tail = new_node
    end
  end

  # add a new node containing value to start of list
  def prepend(value)
    new_node = create_node(value, head)
    length += 1
    if head.nil?
      self.tail = new_node
    end
    self.head = new_node
  end

  # returns total number of nodes in list
  def size
    length
  end

  # returns first node in list
  def find_head
    head
  end

  # returns last node in list
  def find_tail
    tail
  end

  # returns the node at the given index
  def at(index)
    max_index = length - 1
    return nil if head.nil?
    if index > max_index
      return "Error, out of range. Max index is #{max_index}."
    end
    current = head
    index.times do
      current = current[:next]
    end
    current
  end

  # removes the last element from the list
  def pop
    return nil if head.nil?
    current = head
    if current[:next].nil?
      self.head = nil
      self.tail = nil
    else
      while current[:next] && current[:next][:next]
        current = current[:next]
      end
      current[:next] = nil
      self.tail = current
    end
    self.length -= 1
  end

  # returns true if the passed in value is in the list and otherwise returns false
  def contains(v)
    return nil if head.nil?
    current = head
    while current[:next]
      return true if current[:value] == v
      current = current[:next]
    end
    current[:value] == v ? true : false
  end

  # returns the index of the node containing value, or nil if not found
  def find(v)
    return nil if head.nil?
    index = 0
    current = head
    while current[:next]
      return index if current[:value] == v
      current = current[:next]
      index += 1
    end
    current[:value] == v ? index : nil
  end

  # represents linkedlist objects as strings to print out and preview in the console
  #( value ) -> ( value ) -> ( value ) -> null
  def to_string
    current = head
    result = ''
    while current
      result += "( #{current[:value]} ) --> "
      current = current[:next]
    end
    result += 'null'
  end

  {
    append: method(:append),
    prepend: method(:prepend),
    size: method(:size),
    find_head: method(:find_head),
    find_tail: method(:find_tail),
    at: method(:at),
    pop: method(:pop),
    contains: method(:contains),
    find: method(:find),
    to_string: method(:to_string)
  }
end

list = linked_list()
