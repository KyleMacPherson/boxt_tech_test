require 'robot'

describe Robot do
  describe 'placing robot' do
    it 'allows placing on valid position' do
      robot = Robot.new
      robot.place(0,0, 'NORTH')
      expect(robot.placed?).to eq true
    end

    it 'does not allow placing on invalid position' do
      robot = Robot.new
      robot.place(10,0, 'NORTH')
      expect(robot.placed?).to eq false
    end

    it 'allows placing in in valid direction' do
      robot = Robot.new
      robot.place(0,0, 'NORTH')
      expect(robot.placed?).to eq true
    end

    it 'does not allow placing in in invalid direction' do
      robot = Robot.new
      robot.place(0,0, 'LEFT')
      expect(robot.placed?).to eq false
    end
  end

  describe '#left' do
    context 'when robot is facing north' do
      it 'turns to the west' do
        robot = Robot.new
        robot.place(0,0, 'NORTH')
        robot.left
        expect(robot.direction).to eq 'WEST'
      end
    end

    context 'when robot is facing west' do
      it 'turns to the south' do
        robot = Robot.new
        robot.place(0,0, 'WEST')
        robot.left
        expect(robot.direction).to eq 'SOUTH'
      end
    end

    context 'when robot is facing south' do
      it 'turns to the east' do
        robot = Robot.new
        robot.place(0,0, 'SOUTH')
        robot.left
        expect(robot.direction).to eq 'EAST'
      end
    end

    context 'when robot is facing east' do
      it 'turns to the north' do
        robot = Robot.new
        robot.place(0,0, 'EAST')
        robot.left
        expect(robot.direction).to eq 'NORTH'
      end
    end
  end

  describe '#right' do
    context 'when robot is facing north' do
      it 'turns to the east' do
        robot = Robot.new
        robot.place(0,0, 'NORTH')
        robot.right
        expect(robot.direction).to eq 'EAST'
      end
    end

    context 'when robot is facing west' do
      it 'turns to the north' do
        robot = Robot.new
        robot.place(0,0, 'WEST')
        robot.right
        expect(robot.direction).to eq 'NORTH'
      end
    end

    context 'when robot is facing south' do
      it 'turns to the west' do
        robot = Robot.new
        robot.place(0,0, 'SOUTH')
        robot.right
        expect(robot.direction).to eq 'WEST'
      end
    end

    context 'when robot is facing east' do
      it 'turns to the south' do
        robot = Robot.new
        robot.place(0,0, 'EAST')
        robot.right
        expect(robot.direction).to eq 'SOUTH'
      end
    end
  end

  describe '#move' do
    context 'when facing north' do
      context 'when valid move' do
        it 'moves the robot one place up on the Y axis' do
          robot = Robot.new
          robot.place(0,0, 'NORTH')
          robot.move
          expect(robot.x).to eq 0
          expect(robot.y).to eq 1
          expect(robot.direction).to eq 'NORTH'
        end
      end

      context 'when invalid move' do
        it 'ignores the move' do
          robot = Robot.new
          robot.place(0,4, 'NORTH')
          robot.move
          expect(robot.x).to eq 0
          expect(robot.y).to eq 4
          expect(robot.direction).to eq 'NORTH'
        end
      end
    end

    context 'when facing south' do
      context 'when valid move' do
        it 'moves the robot one place down on the Y axis' do
          robot = Robot.new
          robot.place(0,4, 'SOUTH')
          robot.move
          expect(robot.x).to eq 0
          expect(robot.y).to eq 3
          expect(robot.direction).to eq 'SOUTH'
        end
      end

      context 'when invalid move' do
        it 'ignores the move' do
          robot = Robot.new
          robot.place(0,0, 'SOUTH')
          robot.move
          expect(robot.x).to eq 0
          expect(robot.y).to eq 0
          expect(robot.direction).to eq 'SOUTH'
        end
      end
    end

    context 'when facing east' do
      context 'when valid move' do
        it 'moves the robot one place up on the X axis' do
          robot = Robot.new
          robot.place(1,4, 'EAST')
          robot.move
          expect(robot.x).to eq 2
          expect(robot.y).to eq 4
          expect(robot.direction).to eq 'EAST'
        end
      end

      context 'when invalid move' do
        it 'ignores the move' do
          robot = Robot.new
          robot.place(4,4, 'EAST')
          robot.move
          expect(robot.x).to eq 4
          expect(robot.y).to eq 4
          expect(robot.direction).to eq 'EAST'
        end
      end
    end

    context 'when facing west' do
      context 'when valid move' do
        it 'moves the robot one place down on the X axis' do
          robot = Robot.new
          robot.place(1,4, 'WEST')
          robot.move
          expect(robot.x).to eq 0
          expect(robot.y).to eq 4
          expect(robot.direction).to eq 'WEST'
        end
      end

      context 'when invalid move' do
        it 'ignores the move and raises error' do
          robot = Robot.new
          robot.place(0,4, 'WEST')
          robot.move
          expect(robot.x).to eq 0
          expect(robot.y).to eq 4
          expect(robot.direction).to eq 'WEST'
        end
      end
    end
  end
end
