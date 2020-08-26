require_relative '../lib/command_handler.rb'

describe 'giving commands to robot' do
  let(:robot) { Robot.new }
  let(:command_handler) { CommandHandler.new(robot) }

  before(:each) do
    allow($stdout).to receive(:puts)
    commands.each do |command|
      command_handler.run(command)
    end
  end

  context 'that cause robot to fall followed by valid commands' do
    let(:commands) do
      [
        'PLACE 4,4,NORTH',
        'MOVE',
        'LEFT',
        'LEFT',
        'MOVE',
        'REPORT'
      ]
    end

    it 'moves robot to expected position' do
      expect($stdout).to have_received(:puts).with('4,3,SOUTH')
    end
  end

  context 'that include multiple place commands' do
    let(:commands) do
      [
        'PLACE 4,4,NORTH',
        'MOVE',
        'PLACE 0,0,NORTH',
        'REPORT'
      ]
    end

    it 'moves robot to expected position' do
      expect($stdout).to have_received(:puts).with('0,0,NORTH')
    end
  end

  context 'that has commands before a valid place command' do
    let(:commands) do
      [
        'MOVE',
        'LEFT',
        'LEFT',
        'PLACE 0,0,NORTH',
        'MOVE',
        'REPORT'
      ]
    end

    it 'moves robot to expected position' do
      expect($stdout).to have_received(:puts).with('0,1,NORTH')
    end
  end
end
