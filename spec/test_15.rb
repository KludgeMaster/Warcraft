require_relative 'spec_helper'

describe SeigeEngine do

  before do
    @seige_engine = SeigeEngine.new
    @footman = Footman.new
    @peasant = Peasant.new
    @barracks = Barracks.new
    @enemy_seige_engine = SeigeEngine.new
  end

  describe "#attack!" do
    it "should deliver 2x dmg if the target is a SeigeEngine" do
      @seige_engine.attack!(@enemy_seige_engine)
      # SeigeEngine starts at 400HP, after 50 AP dmg which will be doubled,
      # the enemy SeigeEngine should have 300HP
      expect(@enemy_seige_engine.health_points).to eq(300)
    end

    it "should deliver 2x dmg if the target is a Barracks" do
      @seige_engine.attack!(@barracks)
      expect(@barracks.health_points).to eq(400)
    end

    it "should not be able to damage footman or peasant" do
      @seige_engine.attack!(@footman)
      expect(@footman.health_points).to eq(60)
    end
    
    it "should not be able to damage footman or peasant" do
      @seige_engine.attack!(@peasant)
      expect(@peasant.health_points).to eq(35)
    end
  end
end


describe Barracks do
  before do
    @barracks = Barracks.new
  end

  describe "#train_seige_engine" do
    it "should consume resources to train a SeigeEngine" do
      @barracks.train_seige_engine
      expect(@barracks.gold).to eq(800)
      expect(@barracks.food).to eq(77)
      expect(@barracks.lumber).to eq(440)
    end

    it "should not train SeigeEngine if the resource is low" do
      @barracks.should_receive(:food).and_return(1)
      expect(@barracks.can_train_seige_engine?).to be_falsey
    end

  end
end

