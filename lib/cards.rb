#encoding: utf-8

#represents a single playing card
class Card
  
  SUIT_STRINGS = {
    :clubs    => "♣",
    :diamonds => "♦",
    :hearts   => "♥",
    :spades   => "♠"
  }

  VALUE_STRINGS = {
    :deuce => "2",
    :three => "3",
    :four  => "4",
    :five  => "5",
    :six   => "6",
    :seven => "7",
    :eight => "8",
    :nine  => "9",
    :ten   => "10",
    :jack  => "J",
    :queen => "Q",
    :king  => "K",
    :ace   => "A"
  }

  POKER_VALUE = {
    :deuce => 2,
    :three => 3,
    :four  => 4,
    :five  => 5,
    :six   => 6,
    :seven => 7,
    :eight => 8,
    :nine  => 9,
    :ten   => 10,
    :jack  => 11,
    :queen => 12,
    :king  => 13,
    :ace => 14
  }
    
  def self.suits
    SUIT_STRINGS.keys
  end
  
  def self.values
    VALUE_STRINGS.keys
  end
  
  attr_reader :suit, :value, :poker_value
  
  def initialize(suit, value)
    unless Card.suits.include?(suit) && Card.values.include?(value)
      raise "illegal suit (#{suit}) or value (#{value})"
    end
    
    @suit, @value, @poker_value = suit, value, POKER_VALUE[value]
  end
  
  def to_s
    VALUE_STRINGS[value] + SUIT_STRINGS[suit]
  end
end