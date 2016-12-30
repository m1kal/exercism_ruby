class Deque
  def initialize
  end

  def pop
    return -1 if @head.nil?
    temp = @head.value
    @head = @head.previous_value
    temp
  end

  def push(value)
    temp = @head
    @head = Item.new(value, nil, temp)
    temp.next_value = @head unless temp.nil?
    @tail = @head if @tail.nil?
  end

  def shift
    return -1 if @tail.nil?
    temp = @tail.value
    @tail = @tail.next_value
    temp
  end

  def unshift(value)
    temp = @tail
    @tail = Item.new(value, temp, nil)
    temp.previous_value = @tail unless temp.nil?
    @head = @tail if @head.nil?
  end
end

class Item
  attr_accessor :value, :next_value, :previous_value
  def initialize(value, next_value, previous_value)
    @value = value
    @next_value = next_value
    @previous_value = previous_value
  end
end
