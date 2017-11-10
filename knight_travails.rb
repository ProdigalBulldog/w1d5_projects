require_relative "00_tree_node"

class KnightPathFinder
  attr_reader :root
  
  def initialize(pos)
    @start_pos = pos
    @visited_positions = [@start_pos]
    build_move_tree
  end
  
  def build_move_tree
    @root = PolyTreeNode.new(@start_pos)
    queue = [@root]
    until queue.empty?
      current = queue.shift
      child_moves = new_move_positions(current.value)
      child_moves.each do |move| 
        node = PolyTreeNode.new(move)
        current.add_child(node)
        queue << node 
      end 
    end
  end
  
  def new_move_positions(pos)
    moves = KnightPathFinder.valid_moves(pos)
    avail_pos = moves.select {|move| !@visited_positions.include?(move)}
    avail_pos.each {|pos| @visited_positions << pos}
    avail_pos
  end
  
  def self.valid_moves(pos)
    x, y = pos
    valid_pos = [
      [x + 2, y + 1],
      [x + 2, y - 1],
      [x - 2, y + 1],
      [x - 2, y - 1],
      [x + 1, y + 2],
      [x + 1, y - 2],
      [x - 1, y + 2],
      [x - 1, y - 2]  
    ]
    
    valid_pos.select {|x,y| (x <= 7 && x >= 0) && (y <= 7 && y >= 0) }
  end
   
   
end