require_relative 'cards'
require 'pry'
#combine card suit and value when displaying
class Hand
  
  HANDS = {
    :straight_flush => 9,
    :four_of_a_kind => 8,
    :full_house => 7,
    :flush => 6,
    :straight => 5,
    :three_of_a_kind => 4,
    :two_pair => 3,
    :one_pair => 2,
    :high_card => 1
  }
  
  #deals five cards from a deck
  def self.deal_from(deck)
    @cards = []
    @cards + deck.take(5)
  end
  
  attr_accessor :cards
  
  def initialize(cards)
    @cards = cards
    @poker_hand = []
  end
  
  def count
    @cards.count
  end
  
  def draw(n, deck)
    if n + @cards.count > 5
      raise "you can have a max of 5 cards"
    else
      @cards << deck.take(n)
    end
  end
  
  def store_value
    poker_values = []
    @cards.each do |card|
      poker_values << card.poker_value 
    end
    poker_values 
  end
  
  def hand_strength
    poker_hand = self.store_value.sort
    suits = @cards.each { |card| card.suit }.uniq.count
    num_cards = poker_hand.uniq.count
    poker_value = HANDS[:high_card]
    
    #remember to check low and high aces
    dup = poker_hand.dup
    ace_check = [dup.pop] + dup
   
    if straight?(poker_hand) || straight?(ace_check[-1]) && suits == 1
      poker_value = HANDS[:straight_flush]
    
    elsif num_cards == 2 && poker_hand[1] == poker_hand[3]
      poker_value = HANDS[:four_of_a_kind]
  
    elsif num_cards == 2
      poker_value = HANDS[:full_house]
    
    elsif suits == 1
      poker_value = HANDS[:flush]
  
    elsif straight?(poker_hand) || straight?(ace_check[-1])
      poker_value = HANDS[:straight]
      
    elsif num_cards == 3 && three_of_a_kind?(poker_hand)
      poker_value = HANDS[:three_of_a_kind]
   
    elsif num_cards == 3
      poker_value = HANDS[:two_pair]

    elsif num_cards == 4
      poker_value = HANDS[:one_pair]
    end
    poker_value
  end
  
  def straight?(cards)
    cards[-1] - cards[0] == 4
  end
  
  def three_of_a_kind?(cards)
    three = false
    cards.each do |card|
      three = true if cards.count(card) == 3
    end
    three
  end
  
  def beats?(other_hand) ###!!!!Also need to chech strength of pairs, kickers
    if self.hand_strength > other_hand.hand_strength
      true
    elsif self.hand_strength == other_hand.hand_strength
      #compare high cards if same hand
      self.poker_hand[-1] > other_hand.poker_hand[-1]
    else
      false
    end
  end
  
  def show_hand
    @cards.each do |card|
      card.to_s
    end.join(", ")
  end
  
  def return_cards(discard, deck)
    deck.return(discard)
    discard.each do |card|
      @cards.delete_if do |hand_card|
        hand_card.suit == card.suit && hand_card.value == card.value
      end
    end
  end
end