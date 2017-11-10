class PolyTreeNode
  def initialize(value)
    @value = value 
    @parent = nil 
    @children = []
  end 
  
  def parent
    @parent 
  end 
  
  def children
    @children
  end 
  
  def value 
    @value 
  end 
  
  def parent=(value)
    @parent.children.delete(self) unless @parent.nil?
    @parent = value
    @parent.children << self if value != nil && !@parent.children.include?(self)
  end
  
  def add_child(child_node)
    child_node.parent=(self)
  end
  
  def remove_child(child_node)
    child_node.parent=(nil)
    raise "This node is not a child!" if !@children.include?(child_node)
  end
  
  def dfs(target_value)
    return self if @value == target_value
    return nil if @children.empty? 
    @children.each do |node|
      search = node.dfs(target_value)
      return search unless search.nil?
    end
    return nil
  end 
  
  def bfs(target_value)
    queue = [self]
    while !queue.empty?
      current_node = queue.shift
      return current_node if current_node.value == target_value
      current_node.children.each do |child|
        queue.push(child)
      end
    end
    return nil
  end
end