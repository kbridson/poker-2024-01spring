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
    puts "Current main pot: $#{@pot}"
    puts

    puts 'Betting round:'
    self.current_bet = 0
    puts "Player 1, your pot: $#{players[0].pot}"
    puts "Current main pot: $#{@pot}"
    puts "Current bet: $#{self.current_bet}"
    print 'Enter your bet (fold, call, or raise): '
    self.do(players[0], STDIN.gets)
    puts "Main pot is now $#{@pot}"
    puts "Your pot is now $#{players[0].pot}"
    puts

    puts "Player 2, your pot: $#{players[1].pot}"
    puts "Current main pot: $#{@pot}"
    puts "Current bet: $#{self.current_bet}"
    print 'Enter your bet (fold, call, or raise): '
    self.do(players[1], STDIN.gets)
    puts "Main pot is now $#{@pot}"
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
    self.current_bet = 0
    puts "Player 1, your pot: $#{players[0].pot}"
    puts "Current main pot: $#{@pot}"
    puts "Current bet: $#{self.current_bet}"
    print 'Enter your bet (fold, call, or raise): '
    self.do(players[0], STDIN.gets)
    puts "Main pot is now $#{@pot}"
    puts "Your pot is now $#{players[0].pot}"
    puts

    puts "Player 2, your pot: $#{players[1].pot}"
    puts "Current main pot: $#{@pot}"
    puts "Current bet: $#{self.current_bet}"
    print 'Enter your bet (fold, call, or raise): '
    self.do(players[1], STDIN.gets)
    puts "Main pot is now $#{@pot}"
    puts "Your pot is now $#{players[1].pot}"
    puts

    puts 'Final hands:'
    puts "Player 1: #{players[0].hand} (#{Hand.strength(players[0].hand)})"
    puts "Player 2: #{players[1].hand} (#{Hand.strength(players[1].hand)})"
    puts

    puts "Winner is Player 1 with a #{Hand.strength(players[0].hand)}!"
    players[0].pot += @pot
    puts "Player 1 wins $#{@pot}"
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
