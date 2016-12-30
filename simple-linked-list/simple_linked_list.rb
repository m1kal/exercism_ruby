class SimpleLinkedList
  attr_reader :size, :head, :tail

  def initialize
    @size = 0
    @head = nil
  end

  def self.from_a(array)
    return new if array.nil?
    array.reverse.reduce(new) { |acc, elem| acc << elem }
  end

  def push(value)
    @head = Element.new(value, @head)
    @size += 1
  end

  def <<(val)
    push(val)
    self
  end

  def pop
    return nil if empty?
    val = @head.datum
    @head = @head.next
    @size -= 1
    val
  end

  def to_a
    array = []
    item = @head
    until item.nil?
      array << item.datum
      item = item.next
    end
    array
  end

  def reverse
    self.class.from_a(to_a.reverse)
  end

  def empty?
    @size.zero?
  end

  def peek
    @head.nil? ? nil : @head.datum
  end
end

class Element
  attr_accessor :datum, :next

  def initialize(value, next_element = nil)
    @datum = value
    @next = next_element
  end

  def tail?
    @next.nil?
  end
end
