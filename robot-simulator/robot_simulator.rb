class Robot
  DIRECTIONS = [:east, :north, :west, :south].freeze

  attr_reader :coordinates, :bearing

  def initialize
    @bearing = :east
  end

  def orient(direction)
    raise ArgumentError, 'Invalid input' unless DIRECTIONS.include?(direction)
    @bearing = direction
    self
  end

  def turn_right
    turn(-1)
  end

  def turn_left
    turn(1)
  end

  def turn(direction)
    orient(new_direction(direction))
  end

  def new_direction(direction)
    DIRECTIONS[(direction_index + direction) % DIRECTIONS.size]
  end

  def at(*coordinates)
    @coordinates = coordinates
    self
  end

  def advance
    move(direction_index / 2, direction_index % 2)
  end

  def move(sign, axis)
    @coordinates[axis] += sign.zero? ? 1 : -1
  end

  def direction_index
    DIRECTIONS.index(@bearing)
  end

  private :move, :turn, :new_direction, :direction_index
end

class Simulator
  def instructions(input)
    input.each_char.collect do |char|
      case char
      when 'L' then :turn_left
      when 'R' then :turn_right
      when 'A' then :advance
      end
    end
  end

  def place(robot, **where)
    robot.at(where[:x], where[:y]).orient(where[:direction])
  end

  def evaluate(robot, input)
    instructions(input).each do |command|
      robot.send(command)
    end
  end
end
