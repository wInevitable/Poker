require 'rspec'
require 'hand'


describe Hand do
  #draws five cards from the deck
  describe "#::deal_from" do
    it "deals a hand of five cards"
  end
  
  #does not reveal cards to others
  
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