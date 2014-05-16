#combine card suit and value when displaying
class Hand
  
  #deals five cards from a deck
  def self.deal_from(deck)
    @cards = []
    @cards + deck.take(5)
  end
  
  attr_accessor :cards
  
  def initialize(cards)
    @cards = cards
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
    
  end
  
  def beats?(other_hand)
    self.hand_strength > other_hand.hand_strength
  end
  
  def show_hand
    
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