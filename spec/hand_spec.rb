require 'rspec'
require 'hand'


describe Hand do
  #draws five cards from the deck
  describe "#::deal_from" do
    let(:cards) do 
      cards = [ Card.new(:spades, :ten),
             Card.new(:diamonds, :six),
             Card.new(:clubs, :five),
             Card.new(:hearts, :jack),
             Card.new(:spades, :king)
           ]
    end
    
    it "deals a hand of five cards" do
      deck = double("deck")
      deck.should_receive(:take).with(5).and_return(cards)
      hand = Hand.deal_from(deck)
      expect(hand.count).to eq(5)
    end
  end
  
#  let(:hand) { Hand.new }
  #does not reveal cards to others
#  it "does not expose its cards directly" do
#    expect(hand).not_to respond_to(:cards)
#  end
  
  describe "#draw" do
    #exchanges cards
    it "trades in cards and receives new ones" do
      card = double("card")
      deck = double("deck")
      deck.should_receive(:take).with(1).and_return(card)
      
      hand = Hand.new([])
      hand.draw(1, deck)
      
      hand.cards.should include(card)
    end
    
    #attempts to trade in 4 cards should raise an error
    it "does not draw hand greater than 5" do
      expect do
        cards = Array.new(4)
        deck = double("deck")
        hand = Hand.new(cards)
        hand.draw(2, deck)
      end.to raise_error("you can have a max of 5 cards")
    end    
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
    let(:deck) {double("deck")}
    let(:hand) do
      Hand.new([Card.new(:spades, :deuce),
               Card.new(:spades, :three)])
    end
    let(:discard) do
      discard = [Card.new(:spades, :deuce),
              Card.new(:spades, :three)]
    end
    
    it "returns cards to deck" do
      deck.should_receive(:return) do |cards|
        cards.count.should == 2
      end
      
      hand.return_cards(discard, deck)
    end
    
    it "removes cards from hand" do
      deck.stub(:return)
      
      hand.return_cards(discard, deck)
      hand.cards.should == []
    end
  end
end