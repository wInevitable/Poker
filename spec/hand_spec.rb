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
    let(:hand_one) do
      Hand.new([Card.new(:spades, :three),
               Card.new(:diamonds, :three),
               Card.new(:clubs, :three),
               Card.new(:spades, :six),
               Card.new(:spades, :nine)])
    end
    
    #orders hands correctly? - use poker value
    it "returns correct hand strength" do
      expect(hand_one.hand_strength).to eq(4)
    end
  end
  
  describe "#beats?" do
    let(:hand_two) do
      Hand.new([Card.new(:clubs, :deuce),
               Card.new(:diamonds, :three),
               Card.new(:spades, :ten),
               Card.new(:hearts, :king),
               Card.new(:clubs, :ace)])
    end
    let(:hand_three) do
      Hand.new([Card.new(:clubs, :deuce),
               Card.new(:clubs, :three),
               Card.new(:clubs, :ten),
               Card.new(:clubs, :king),
               Card.new(:clubs, :ace)])
    end
    it "returns true if hand strength is stronger than opp" do
      expect(hand_three.beats?(hand_two)).to eq(true)
    end
    
    it "returns false if hand strength equal to or weaker than op" do
      expect(hand_two.beats?(hand_three)).to eq(false)
    end
  end

  #reveals - render method
  describe "#show_hand" do
    let(:deck) {double("deck")}
    let(:hand) do
      Hand.new([Card.new(:spades, :deuce),
               Card.new(:spades, :three)])
    end
  
    it "prints hand strength to string" do
      expect(hand.show_hand).to eq("2♠, 3♠")
    end
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