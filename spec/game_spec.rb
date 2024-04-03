# frozen_string_literal: true

require 'game'

RSpec.describe Game do
  describe '#play' do
    it 'plays a 2 player game with raise then see, no folds, no discards' do
      game = Game.new

      p1 = Player.new
      p1.pot = 500
      p2 = Player.new
      p2.pot = 500
      allow(p1).to receive(:hand).and_return '10♠, J♦, Q♠, K♠, A♠'
      allow(p2).to receive(:hand).and_return '2♣, 3♣, 9♦, J♣, K♦'
      game.players = [p1, p2]

      allow(Hand).to receive(:strength).with('10♠, J♦, Q♠, K♠, A♠').and_return('Royal Flush')
      allow(Hand).to receive(:strength).with('2♣, 3♣, 9♦, J♣, K♦').and_return('High Card')

      $stdout = StringIO.new
      inputs = ['raise 10', 'call', 'none', 'none', 'raise 50', 'call']
      # allow($stdin).to receive(:gets).and_return(*inputs)
      input_enum = inputs.to_enum

      allow($stdin).to receive(:gets) do
        input = input_enum.next
        $stdout.print("#{input}\n") # This will write the input to your captured $stdout
        input # This will be the return value of $stdin.gets call
      end

      game.play

      expect($stdout.string.chomp).to eq(File.read('spec/fixtures/run0.txt'))
      expect($stdin).to have_received(:gets).exactly(6).times
    end

    it 'plays a different 2 player game with raise then see, no folds, no discards' do
      game = Game.new

      p1 = Player.new
      p1.pot = 100
      p2 = Player.new
      p2.pot = 100
      allow(p1).to receive(:hand).and_return '9♠, 10♠, J♦, Q♠, K♠'
      allow(p2).to receive(:hand).and_return '2♣, 4♣, 9♦, J♣, K♦'
      game.players = [p1, p2]

      allow(Hand).to receive(:strength).with('9♠, 10♠, J♦, Q♠, K♠').and_return('Flush')
      allow(Hand).to receive(:strength).with('2♣, 4♣, 9♦, J♣, K♦').and_return('High Card')

      $stdout = StringIO.new
      inputs = ['raise 10', 'call', 'none', 'none', 'raise 50', 'call']
      # allow($stdin).to receive(:gets).and_return(*inputs)
      input_enum = inputs.to_enum

      allow($stdin).to receive(:gets) do
        input = input_enum.next
        $stdout.print("#{input}\n") # This will write the input to your captured $stdout
        input  # This will be the return value of $stdin.gets call
      end

      game.play

      expect($stdout.string.chomp).to eq(File.read('spec/fixtures/run1.txt'))
      expect($stdin).to have_received(:gets).exactly(6).times
    end
  end
end
