class CircularBuffer < Array
  class BufferEmptyException < RuntimeError
  end
  class BufferFullException < RuntimeError
  end

  def initialize(buffer_size)
    super(buffer_size)
    clear
  end

  def write(value)
    raise BufferFullException if full?
    write!(value)
  end

  def write!(value)
    increase_read_pointer if full?
    self[@write_pointer] = value
    @empty = false
    increase_write_pointer
    self
  end

  def read
    raise BufferEmptyException if @empty
    tmp = self[@read_pointer]
    increase_read_pointer
    @empty ||= @write_pointer == @read_pointer
    tmp
  end

  def full?
    (@write_pointer == @read_pointer) && !@empty
  end

  def increase_write_pointer
    @write_pointer = (@write_pointer + 1) % size
  end

  def increase_read_pointer
    @read_pointer = (@read_pointer + 1) % size
  end

  def clear
    @read_pointer = @write_pointer = 0
    @empty = true
  end
end
