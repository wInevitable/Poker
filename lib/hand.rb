#combine card suit and value when displaying
class Hand
  
  POKER_HANDS = {
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
  
  def hand_strength
    @poker_hand = @cards.each { |card| card.poker_value }.sort
    poker_value = 1
    if #straight_flush - if top - bottom = 4 and suit
    
    elsif #four_of_a_kind - four of same value

    elsif #full_house
    
    elsif #flush
    
    elsif #straight - if top - bottom = 4
      
    elsif #three_of_a_kind
    
    elsif #two_pair
      
    elsif #one_pair?
      
    end
    poker_value
  end
  
  def beats?(other_hand)
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