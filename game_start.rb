require_relative 'game_board.rb'
require_relative 'graph_vertex.rb'
require_relative 'input_output.rb'

# Initializes and processes the game
class Game
  include Board
  include InputOutput

  def initialize
    puts "Welcome to Knight Travails! \n
    Your knight will move from starting point to end point in minimum possible moves. \n
    Use the following board to input your start and end points in algebraic notation.
    Hint: The cell in the lower left corner will be 'a1' \n\n\n"
    start_game
  end

  def start_game
    print_board
    puts "\n\nEnter your start position:"
    start_point = user_input
    puts 'Enter your end position:'
    end_point = user_input
    knight_moves(start_point, end_point)
  end

  def knight_moves(start_point, end_point)
    graph = Graph.new
    puts 'Your knight will take the following path:'
    path(graph, start_point, end_point).each { |cell| puts process_output(cell) }
    play_again?
  end

  def path(graph, start_point, end_point)
    current = graph.current_vertex(start_point)
    graph = graph.assign_scores(current, end_point)
    graph.shortest_path(end_point)
  end

  def play_again?
    puts 'Would you like to play again? (y/n)'
    ans = gets.chomp.downcase
    if ans == 'y' 
      start_game
    else
      puts 'Thanks for playing'
    end
  end
end