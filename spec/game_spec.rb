# frozen_string_literal: true

require 'game'

RSpec.describe Game do
  describe '#play' do
    it 'plays a 2 player game (run0) with raise then see, no folds, no discards' do
      game = Game.new

      p1 = Player.new
      p1.pot = 500
      p2 = Player.new
      p2.pot = 500
      hand1 = '10♠, J♦, Q♠, K♠, A♠'
      hand2 = '2♣, 3♣, 9♦, J♣, K♦'
      allow(p1).to receive(:hand).and_return hand1
      allow(p2).to receive(:hand).and_return hand2
      game.players = [p1, p2]

      allow(Hand).to receive(:strength).with(hand1).and_return('Royal Flush')
      allow(Hand).to receive(:strength).with(hand2).and_return('High Card')

      $stdout = StringIO.new
      inputs = ['raise 10', 'call', 'none', 'none', 'raise 50', 'call']
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

    it 'plays a 2 player game (run1) with raise then see, no folds, no discards' do
      game = Game.new

      p1 = Player.new
      p1.pot = 100
      p2 = Player.new
      p2.pot = 100
      hand1 = '9♠, 10♠, J♦, Q♠, K♠'
      hand2 = '2♣, 4♣, 9♦, J♣, K♦'
      allow(p1).to receive(:hand).and_return hand1
      allow(p2).to receive(:hand).and_return hand2
      game.players = [p1, p2]

      allow(Hand).to receive(:strength).with(hand1).and_return('Flush')
      allow(Hand).to receive(:strength).with(hand2).and_return('High Card')

      $stdout = StringIO.new
      inputs = ['raise 10', 'call', 'none', 'none', 'raise 50', 'call']
      input_enum = inputs.to_enum

      allow($stdin).to receive(:gets) do
        input = input_enum.next
        $stdout.print("#{input}\n")
        input
      end

      game.play

      expect($stdout.string.chomp).to eq(File.read('spec/fixtures/run1.txt'))
      expect($stdin).to have_received(:gets).exactly(6).times
    end

    it 'plays a 2 player game (run2) with raise then see, no folds, no discards' do
      game = Game.new

      p1 = Player.new
      p1.pot = 100
      p2 = Player.new
      p2.pot = 100
      hand1 = '9♠, 10♠, J♦, Q♠, K♠'
      hand2 = '2♣, 4♣, 9♦, J♣, K♦'
      allow(p1).to receive(:hand).and_return hand1
      allow(p2).to receive(:hand).and_return hand2
      game.players = [p1, p2]

      allow(Hand).to receive(:strength).with(hand1).and_return('Flush')
      allow(Hand).to receive(:strength).with(hand2).and_return('High Card')

      $stdout = StringIO.new
      inputs = ['raise 5', 'call', 'none', 'none', 'raise 10', 'call']
      input_enum = inputs.to_enum

      allow($stdin).to receive(:gets) do
        input = input_enum.next
        $stdout.print("#{input}\n")
        input
      end

      game.play

      expect($stdout.string.chomp).to eq(File.read('spec/fixtures/run2.txt'))
      expect($stdin).to have_received(:gets).exactly(6).times
    end
  end

  describe '#do' do
    context 'when call' do
      it 'should change player pot by current bet when bet is 10' do
        game = Game.new
        game.current_bet = 10

        p1 = Player.new
        p1.pot = 100
        action = 'call'

        expect { game.do(p1, action) }.to change(p1, :pot).from(100).to(90)
      end

      it 'should change player pot by current bet when bet is 5' do
        game = Game.new
        game.current_bet = 5

        p1 = Player.new
        p1.pot = 100
        action = 'call'

        expect { game.do(p1, action) }.to change(p1, :pot).from(100).to(95)
      end

      it 'should change game pot by current bet' do
        game = Game.new
        game.current_bet = 10

        p1 = Player.new
        p1.pot = 100
        action = 'call'

        expect { game.do(p1, action) }.to change(game, :pot).from(0).to(10)
      end
    end

    context 'when raise by x' do
      it 'should change player pot and game pot by current bet (0) + raise amt (5) = 5' do
        game = Game.new
        game.current_bet = 0

        p1 = Player.new
        p1.pot = 100
        action = 'raise 5'

        expect { game.do(p1, action) }.to change(p1, :pot).from(100).to(95).and change(game, :pot).from(0).to(5)
      end

      it 'should change player pot and game pot by current bet (5) + raise amt (5) = 10' do
        game = Game.new
        game.current_bet = 5

        p1 = Player.new
        p1.pot = 100
        action = 'raise 5'

        expect { game.do(p1, action) }.to change(p1, :pot).from(100).to(90).and change(game, :pot).from(0).to(10)
      end

      it 'should increase current bet by val' do
        game = Game.new
        game.current_bet = 5

        p1 = Player.new
        p1.pot = 100
        action = 'raise 5'

        expect { game.do(p1, action) }.to change(game, :current_bet).from(5).to(10)
      end
    end
  end
end
