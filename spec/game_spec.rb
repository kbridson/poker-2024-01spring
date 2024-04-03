# frozen_string_literal: true

require 'game'

RSpec.describe Game do
  describe '#play' do
    it 'plays a 2 player game with raise then see, no folds, no discards' do
      game = Game.new
      $stdout = StringIO.new
      game.play
      expect($stdout.string.chomp).to eq(File.read('spec/fixtures/run0.txt'))
    end
  end
end
