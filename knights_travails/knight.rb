# frozen_string_literal: true

square_registry = {}

ChessSquare = lambda do |x, y|
  x_pos = x
  y_pos = y
  predecessor = nil

  moves = [
    [1, 2],
    [1, -2],
    [2, 1],
    [2, -1],
    [-1, 2],
    [-1, -2],
    [-2, 1],
    [-2, -1]
  ]

  name = "#{x}, #{y}"

  create_knight_moves = lambda do
    moves
      .map { |offset| new_square_from(offset[0], offset[1]) }
      .compact
  end

  new_square_from = lambda do |x_offset, y_offset|
    new_x = x_pos + x_offset
    new_y = y_pos + y_offset
    return unless new_x.between?(0, 7) && new_y.between?(0, 7)

    square_registry["#{new_x}, #{new_y}"] ||= ChessSquare.call(new_x, new_y)
  end

  if square_registry.key?(name)
    square_registry[name]
  else
    new_square = {
      name: name,
      get_predecessor: -> { predecessor },
      set_predecessor: ->(new_pred) { predecessor ||= new_pred },
      create_knight_moves: create_knight_moves
    }
    square_registry[name] = new_square
    new_square
  end
end

def knight_moves(start, finish)
  square_registry.clear

  origin = ChessSquare.call(*start)
  target = ChessSquare.call(*finish)

  queue = [origin]
  until queue.include?(target)
    current_square = queue.shift
    enqueue_list = current_square[:create_knight_moves].call
    enqueue_list.each { |square| square[:set_predecessor].call(current_square) }
    queue.push(*enqueue_list)
  end
  path = [target]
  path.unshift(path[0][:get_predecessor].call) until path.include?(origin)

  puts "The shortest path was #{path.length - 1} moves!"
  puts 'The moves were:'
  path.each { |square| puts square[:name] }
end
