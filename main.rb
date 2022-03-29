require_relative 'knight_moves'
require_relative 'graph_vertex'
require_relative 'game_board'
require_relative 'input_output'

puts "Welcome to Knight Travails! \n
Your knight will move from starting point to end point in minimum possible moves. \n
Use the following board to input your start and end points in algebraic notation.
Hint: The cell in the lower left corner will be 'a1' \n\n\n"
print_board
puts "\n\nEnter your start position:"
start_point = gets.chomp.split('')
start_point = clean_input(start_point)
puts 'Enter your end position:'
end_point = gets.chomp.split('')
end_point = clean_input(end_point)
knight_moves(start_point, end_point)


