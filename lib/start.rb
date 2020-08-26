require_relative './robot'
require_relative './command_handler'

file_name = ARGV.first
file_data = File.read(file_name).split("\n")
robot = Robot.new
command_handler = CommandHandler.new(robot)

file_data.each do |command|
  command_handler.run(command)
end
