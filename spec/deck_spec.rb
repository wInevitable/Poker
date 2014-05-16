require 'rspec'
require 'deck'

describe Deck do
  #returns an array of 52 cards
  describe "::all_cards" do
    subject(:all_cards) { Deck.all_cards }
    
    it "holds 52 cards" do
      expect(all_cards.count).to eq(52)
    end
    
    it "has no duplicates" do
      expect(all_cards.uniq.count).to eq(52)
    end
  end
  
  #double this
  let(:cards) do
    double([[:diamonds, :queen], [:clubs, :ten], [:hearts, :jack]])
  end
  
  #builds the deck appropriately when initialized
  describe "initialize" do
    it "defaults to 52 cards" do
      expect(deck.count).to eq(52)
    end
    
    it "can be fed an array of cards" do
      expect(Deck.new(cards).count).to eq(3)
    end
  end
  
  let(:deck) do
    Deck.new(cards.dup)
  end
  
  it "does not expose its cards directly" do
    expect(deck).not_to respond_to(:cards)
  end
  
  #deals cards
  describe "#take" do
    it "takes cards from the top of the deck" do
      expect(deck.take(1)).to eq(cards[0..0])
      expect(deck.take(2)).to eq(cards[1..2])
    end
    
    it "removes cards from the deck" do
      deck.take(2)
      expect(deck.count).to eq(1)
    end
    
    it "does not allow you to take more cards than there are in the deck" do
      expected do
        deck.take(4)
      end.to raise_error("not enough cards")
    end
  end  
  
  #returns cards to the deck
  describe "#return" do
    let(:extra_cards) do
      double([[:clubs, :deuce], [:spades, :six], [:diamonds, :eight]])
    end
    
    it "adds card back to the deck" do
      expect(deck.return(extra_cards).count).to eq(6)
    end
    
    it "does not destory the cards passed in" do
      more_cards = extra_cards.dup
      deck.return(more_cards)
      expected(more_cards).to eq(extra_cards)
    end
    
    it "returns cards to the bottom of the deck" do
      deck.return(extra_cards) #6 cards
      deck.take(3) #3 cards gone
      
      expect(deck.take(1)).to eq(extra_cards[0..0])
      expect(deck.take(2)).to eq(extra_cards[1..2])
    end
  end
end