require_relative 'input_output.rb'

def knight_moves(start_point, end_point)
  graph = Graph.new
  current = graph.current_vertex(start_point)
  graph = graph.assign_scores(current, end_point)
  path = graph.shortest_path(end_point)
  puts 'Your knight will take the following path:'
  path.each { |cell| puts process_output(cell) }
end

