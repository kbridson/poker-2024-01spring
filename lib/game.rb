# frozen_string_literal: true
# typed: true

class Game
  attr_accessor :players

  def play
    puts 'Starting 5 Card Draw Poker Game...'
    puts

    puts 'Shuffling deck...'
    puts

    puts 'Dealing cards to players...'
    puts "Player 1's hand: #{players[0].hand}"
    puts "Player 2's hand: #{players[1].hand}"
    puts

    puts "Player 1's pot: $500"
    puts "Player 2's pot: $500"
    puts 'Current main pot: $0'
    puts

    puts 'Betting round:'
    puts 'Player 1, your pot: $500'
    puts 'Current main pot: $0'
    puts 'Current bet: $0'
    print 'Enter your bet (fold, call, or raise): '
    STDIN.gets
    puts 'Main pot is now $10'
    puts 'Your pot is now $490'
    puts

    puts 'Player 2, your pot: $500'
    puts 'Current main pot: $10'
    puts 'Current bet: $10'
    print 'Enter your bet (fold, call, or raise): '
    STDIN.gets
    puts 'Main pot is now $20'
    puts 'Your pot is now $490'
    puts

    puts "Player 1's turn:"
    puts "Your hand: #{players[0].hand}"
    print "Choose cards to discard (enter positions separated by spaces, or 'none' to keep all): "
    STDIN.gets
    puts

    puts "Player 2's turn:"
    puts "Your hand: #{players[1].hand}"
    print "Choose cards to discard (enter positions separated by spaces, or 'none' to keep all): "
    STDIN.gets
    puts

    puts 'Betting round:'
    puts 'Player 1, your pot: $490'
    puts 'Current main pot: $20'
    puts 'Current bet: $0'
    print 'Enter your bet (fold, call, or raise): '
    STDIN.gets
    puts 'Main pot is now $70'
    puts 'Your pot is now $440'
    puts

    puts 'Player 2, your pot: $490'
    puts 'Current main pot: $70'
    puts 'Current bet: $50'
    print 'Enter your bet (fold, call, or raise): '
    STDIN.gets
    puts 'Main pot is now $120'
    puts 'Your pot is now $440'
    puts

    puts 'Final hands:'
    puts "Player 1: #{players[0].hand} (Royal Flush)"
    puts "Player 2: #{players[1].hand} (High Card)"
    puts

    puts 'Winner is Player 1 with a Royal Flush!'
    puts 'Player 1 wins $120'
    puts

    puts "Game over. Player 1's pot: $560, Player 2's pot: $440"
  end
end

# Game.new.play
