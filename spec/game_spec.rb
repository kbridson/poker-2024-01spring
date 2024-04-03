# frozen_string_literal: true

require 'game'

RSpec.describe Game do
  describe '#play' do
    it 'plays a 2 player game with raise then see, no folds, no discards' do
      game = Game.new

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

      expect($stdout.string.chomp).to eq(File.read('spec/fixtures/run0.txt'))
      expect($stdin).to have_received(:gets).exactly(6).times
    end
  end
end
