# Five Card Draw Poker Game

## Overview

In this project, you'll apply Object-Oriented Programming (OOP) principles, Test-Driven Development (TDD) methodologies, and work with Git for version control, to implement a Five Card Draw Poker game in Ruby. The project aims to strengthen your understanding of Ruby OOP, RSpec testing, TDD practices, and UML diagramming, through practical application.

## UML Diagram

```mermaid
classDiagram
  Deck *-- "0..52" Card
  Hand *-- "2..5" Card
  Player o-- "1" Hand
  Game o-- "2..*" Player
  class Card {
    -string suit
    -string value
  }
  class Deck {
    -Card[52] cards
    +shuffle!()
    +deal()
  }
  class Hand {
    -Card[5] cards
    +beats(hand: Hand) bool
    -strength()
  }
  class Player {
    -Hand hand
    -int pot
  }
  class Game {
    -Deck deck
    -Player[] players
    -int turn
    -int pot
    -int bet
  }
```

## Game Process

1. Initialize the deck
2. Shuffle the deck
3. Register players
4. Ante - default 10
5. Deal initial cards to each player
