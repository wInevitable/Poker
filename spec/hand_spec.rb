require 'rspec'
require 'hand'


describe Hand do
  #draws five cards from the deck
  describe "#::deal_from" do
    let(:cards) do 
      cards = { Card.new(:spade, :ten),
             Card.new(:diamonds, :six),
             Card.new(:clubs, :five),
             Card.new(:hearts, :jack),
             Card.new(:spades, :king)
           }
    end
    
    it "deals a hand of five cards" do
      deck = double("deck")
      deck.should_receive(:take).with(5).and_return(cards)
      hand = Hand.deal_from(deck)
      expect(hand.cards).to eq(cards)
    end
  end
  
  #does not reveal cards to others
  it "does not expose its cards directly" do
    expect(hand).not_to respond_to(:cards)
  end
  
  describe "#draw" do
    #exchanges cards
    it "trades in cards and receives new ones"
    #.count == 5, !=
    
    #attempts to trade in 4 cards should raise an error
    it "does not trade in more than 3 cards"
    
  end

  describe "#hand_strength" do
    it "returns hand strength"
    #use array to order hands?
    
    it "picks the strongest hand"
    #multiple hands - returns strongest one
  end
  
  describe "#beats?" do
    it "returns true if hand strength is stronger than opp"
    
    it "returns false if hand strength equal to or weaker than op"
  end

  #reveals
  describe "#show_hand" do
    it "exposes hand strength to game"
    #render method
  end
  
  describe "#return_cards" do
    it "returns cards to deck"
    
    it "removes cards from hand"
  end
end