class PolyTreeNode

  attr_reader :parent, :value
  attr_accessor :children

  def initialize(value)
    @children = []
    @value = value
    @parent = nil
  end

  def parent=(node)
    @parent.children.delete_if { |child| child == self } unless @parent.nil?
    @parent = node
    node.children << self unless @parent.nil?
  end

  def add_child(child_node)
    child_node.parent = self
  end

  def remove_child(child_node)
    raise 'Not my kid' unless child_node.parent == self
    child_node.parent = nil
  end

  def dfs(target)

    return self if self.value == target
    while @children.length > 0
      child = @children.shift
      n = child.dfs(target)
      return n unless n.nil?
    end
    nil
  end



  def bfs(target)

    queue = [self]

    until queue.empty? # Change each to until queue.empty?

      if queue.first.value == target
        return queue.first
      end

      new_children = queue.first.children

      queue.concat(new_children)
      queue.shift
    end

    nil
  end

end
