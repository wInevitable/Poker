require 'cards'

class Deck
  
  #initialize array of 52 unique cards
  def self::all_cards
    all_cards = []
    
    Card.suits.each do |suit|
      Card.values.each do |value|
        all_cards << Card.new(suit, value)
      end
    end
    
    all_cards
  end
  
  #initialize a deck, either 52 cards (default) or a given deck
  def initialize(cards = Deck.all_cards)
    @cards = cards
  end
  
  #gives a count of the cards in the deck
  def count
    @cards.count
  end
  
  #take n cards from the top of the deck
  def take(n)
    raise "not enough cards" if n > self.count
    @cards.shift(n)
  end
  
  def return(cards)
    @cards.concat(cards)
  end
end