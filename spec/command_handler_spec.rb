# stub robot and assert that robot receives each method
require_relative '../lib/command_handler.rb'

describe CommandHandler do
  let(:robot) { double(:Robot, place: nil, move: nil, left: nil, right: nil, x: 1, y: 1, direction: 'EAST') }
  subject { described_class.new(robot) }

  context '#run' do
    context 'PLACE' do
      it 'calls place on the robot with correct arguments' do
        subject.run('PLACE 0,0,NORTH')
        expect(robot).to have_received(:place).with('0', '0', 'NORTH')
      end
    end

    context 'MOVE' do
      it 'calls move on the robot' do
        subject.run('MOVE')
        expect(robot).to have_received(:move)
      end
    end

    context 'LEFT' do
      it 'calls left on the robot' do
        subject.run('LEFT')
        expect(robot).to have_received(:left)
      end
    end

    context 'RIGHT' do
      it 'calls right on the robot' do
        subject.run('RIGHT')
        expect(robot).to have_received(:right)
      end
    end

    context 'REPORT' do
      it 'returns the position and direction of robot' do
        allow($stdout).to receive(:puts)
        subject.run('REPORT')
        expect($stdout).to have_received(:puts).with('1,1,EAST')
      end
    end

    context 'bad instruction' do
      it 'raises error' do
        expect { subject.run('INCORRECT') }.to raise_error CommandHandler::UnknownCommand
      end
    end
  end
end
