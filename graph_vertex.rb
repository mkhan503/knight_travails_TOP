require_relative 'knight_moves'
# Creates vertex for Graph
class Vertex
  attr_accessor :data, :score, :neighbors, :visited

  def initialize(data, neighbors, score = 0, visited: false)
    @data = data
    @score = score
    @neighbors = neighbors
    @visited = visited
  end

  def each_vertex_neighbor(vertices)
    neighbors.each do |neighbor|
      vertices.each do |vertex|
        yield(vertex, neighbor)
      end
    end
  end
end

# creates graph for possible moves on the board
class Graph
  attr_reader :vertices

  def initialize
    array = (0..7).to_a.repeated_permutation(2).to_a
    @vertices = build_graph(array)
  end

  def build_graph(array)
    return_array = []
    array.each do |element|
      return_array << Vertex.new(element, get_neighbors(element))
    end
    return_array
  end

  def get_neighbors(coordinates)
    moves = [[-2, -1], [-2, 1], [-1, -2], [-1, 2], [1, -2], [1, 2], [2, -1], [2, 1]]
    moves.filter_map do |element|
      first = element[0] + coordinates[0]
      second = element[1] + coordinates[1]
      [first, second] if (0..7).include?(first) && (0..7).include?(second)
    end
  end

  def assign_scores(current, end_point, visit_score = 0, queue = [current])
    return self if current.data == end_point

    current.visited = true
    visit_score = current.score + 1
    queue = add_to_queue(queue, current, visit_score)
    queue.shift
    assign_scores(queue[0], end_point, visit_score, queue)
  end

  def add_to_queue(queue, current, score)
    current.each_vertex_neighbor(vertices) do |vertex, neighbor|
      if vertex.data == neighbor && vertex.visited == false
        vertex.score = score
        queue << vertex
      end
    end
    queue
  end

  def shortest_path(end_point)
    current = current_vertex(end_point)
    reverse_traverse(current, [current.data])
  end

  # traverses the scored graph from end_point to start_point to find the shortest path.
  def reverse_traverse(current, path)
    while current.score != 0
      temp = add_vertices(current)
      current = temp[0]
      path.prepend(current.data)
    end
    path
  end

  def add_vertices(current)
    array = []
    current.each_vertex_neighbor(vertices) do |vertex, neighbor|
      array << vertex if vertex.data == neighbor && vertex.score == current.score - 1
    end
    array
  end

  def current_vertex(dest)
    current = nil
    vertices.each { |vertex| current = vertex if vertex.data == dest }
    current
  end
end
