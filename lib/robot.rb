# frozen_string_literal: true
class Robot
  class UnknownDirection < StandardError; end
  attr_reader :x, :y, :direction

  NORTH = 'NORTH'
  SOUTH = 'SOUTH'
  EAST = 'EAST'
  WEST = 'WEST'

  VALID_POSITIONS = [0,1,2,3,4]
  VALID_DIRECTIONS = [
    NORTH,
    SOUTH,
    EAST,
    WEST
  ]
  NEW_DIRECTION_AFTER_LEFT_ROTATE = {
    NORTH => WEST,
    EAST => NORTH,
    SOUTH => EAST,
    WEST => SOUTH
  }
  NEW_DIRECTION_AFTER_RIGHT_ROTATE = {
    NORTH => EAST,
    EAST => SOUTH,
    SOUTH => WEST,
    WEST => NORTH
  }

  def initialize
    @placed = false
  end

  def place(x,y,direction)
    return unless VALID_POSITIONS.include?(x.to_i) && VALID_POSITIONS.include?(y.to_i)
    return unless VALID_DIRECTIONS.include?(direction)

    @x = x.to_i
    @y = y.to_i
    @direction = direction
    @placed = true
  end

  def placed?
    !!@placed
  end

  def move
    return unless placed?
    case direction
    when NORTH
      return  if y > 3
      @y += 1
    when SOUTH
      return if y < 1
      @y -= 1
    when EAST
      return if x > 3
      @x += 1
    when WEST
      return if x < 1
      @x -= 1
    else
      raise UnknownDirection, direction
    end
  end

  def left
    return unless placed?
    @direction = NEW_DIRECTION_AFTER_LEFT_ROTATE[@direction]
  end

  def right
    return unless placed?
    @direction = NEW_DIRECTION_AFTER_RIGHT_ROTATE[@direction]
  end
end
