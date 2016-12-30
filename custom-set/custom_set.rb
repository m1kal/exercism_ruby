class CustomSet
  def initialize(items)
    @items = []
    items.each { |item| add(item) }
  end

  def to_a
    @items.dup
  end

  def empty?
    @items.size.zero?
  end

  def member?(value)
    @items.any? { |item| item == value }
  end

  def subset?(other)
    @items.all?(&check_if_member(other))
  end

  def disjoint?(other)
    @items.none?(&check_if_member(other))
  end

  def ==(other)
    subset?(other) && other.subset?(self)
  end

  def add(item)
    @items << item
    @items.uniq!
    self
  end

  def intersection(other)
    self.class.new(@items.select(&check_if_member(other)))
  end

  def difference(other)
    self.class.new(@items.reject(&check_if_member(other)))
  end

  def union(other)
    self.class.new(@items + other.to_a)
  end

  def check_if_member(other)
    lambda { |item| other.member?(item) }
  end
end

module BookKeeping
  VERSION = 1
end
