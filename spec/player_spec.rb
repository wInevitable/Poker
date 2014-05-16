require 'rspec'
require 'player'

describe Player do
  subject(:player) do
    Player.new('Greg', 1000)
  end
  
  describe "#initialize" do
    it "sets the correct name" do
      expect(player.name).to eq('Greg')
    end
    
    it "sets the bankroll appropriately" do
      expect(player.bankroll).to eq(1000)
    end
  end
  
  describe "#pay_winnings" do
    
  end
  
  describe "#return_cards" do
    
  end
  
  describe "#place_bet" do
    
  end
end