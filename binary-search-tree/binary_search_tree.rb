class Bst
  VERSION = 1
  attr_reader :data, :left, :right

  def initialize(value)
    @data = value
  end

  def insert(value)
    if value <= @data
      @left = insert_to_node(@left, value)
    else
      @right = insert_to_node(@right, value)
    end
  end

  def insert_to_node(node, value)
    if node.nil?
      Bst.new(value)
    else
      node.insert(value)
      node
    end
  end

  def each(&block)
    to_a.each(&block)
  end

  def to_a
    [
      @left.nil? ? [] : @left.to_a,
      @data,
      @right.nil? ? [] : @right.to_a
    ].flatten
  end

  private :insert_to_node
end
