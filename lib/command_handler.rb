# frozen_string_literal: true
require_relative './robot'

class CommandHandler
  class UnknownCommand < StandardError; end
  attr_reader :robot

  def initialize(robot)
    @robot = robot
  end

  def run(command)
    case command.upcase
    when /PLACE /
      placing_params = parse_placing_params(command)
      robot.place(*placing_params)
    when 'REPORT'
      puts "#{robot.x},#{robot.y},#{robot.direction}"
    when 'MOVE'
      robot.move
    when 'LEFT'
      robot.left
    when 'RIGHT'
      robot.right
    else
      raise UnknownCommand, "unknown command: #{command}"
    end
  end

  private

    def parse_placing_params(command)
      command.sub('PLACE ', '').split(',')
    end
end
