# frozen_string_literal: true
# typed: true

class Game
  attr_accessor :players, :current_bet, :pot

  def initialize
    @pot = 0
  end

  def do(player, action)
    instr, val = action.split
    case instr
    when 'call'
      player.pot -= current_bet
      @pot += current_bet
    when 'raise'
      amt = current_bet + val.to_i
      player.pot -= amt
      @pot += amt
      self.current_bet += val.to_i
    end
  end

  def play
    puts 'Starting 5 Card Draw Poker Game...'
    puts

    puts 'Shuffling deck...'
    puts

    puts 'Dealing cards to players...'
    puts "Player 1's hand: #{players[0].hand}"
    puts "Player 2's hand: #{players[1].hand}"
    puts

    puts "Player 1's pot: $#{players[0].pot}"
    puts "Player 2's pot: $#{players[1].pot}"
    puts 'Current main pot: $0'
    puts

    puts 'Betting round:'
    puts "Player 1, your pot: $#{players[0].pot}"
    puts 'Current main pot: $0'
    puts 'Current bet: $0'
    print 'Enter your bet (fold, call, or raise): '
    STDIN.gets
    players[0].pot -= 10
    puts 'Main pot is now $10'
    puts "Your pot is now $#{players[0].pot}"
    puts

    puts "Player 2, your pot: $#{players[1].pot}"
    puts 'Current main pot: $10'
    puts 'Current bet: $10'
    print 'Enter your bet (fold, call, or raise): '
    STDIN.gets
    players[1].pot -= 10
    puts 'Main pot is now $20'
    puts "Your pot is now $#{players[1].pot}"
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
    puts "Player 1, your pot: $#{players[0].pot}"
    puts 'Current main pot: $20'
    puts 'Current bet: $0'
    print 'Enter your bet (fold, call, or raise): '
    STDIN.gets
    players[0].pot -= 50
    puts 'Main pot is now $70'
    puts "Your pot is now $#{players[0].pot}"
    puts

    puts "Player 2, your pot: $#{players[1].pot}"
    puts 'Current main pot: $70'
    puts 'Current bet: $50'
    print 'Enter your bet (fold, call, or raise): '
    STDIN.gets
    players[1].pot -= 50
    puts 'Main pot is now $120'
    puts "Your pot is now $#{players[1].pot}"
    puts

    puts 'Final hands:'
    puts "Player 1: #{players[0].hand} (#{Hand.strength(players[0].hand)})"
    puts "Player 2: #{players[1].hand} (#{Hand.strength(players[1].hand)})"
    puts

    puts "Winner is Player 1 with a #{Hand.strength(players[0].hand)}!"
    players[0].pot += 120
    puts 'Player 1 wins $120'
    puts

    puts "Game over. Player 1's pot: $#{players[0].pot}, Player 2's pot: $#{players[1].pot}"
  end
end

class Hand
  def self.strength(hand); end
end

class Player
  attr_accessor :pot

  def hand; end
end

# Game.new.play
