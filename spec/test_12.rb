require_relative 'spec_helper' 

describe Unit do
  before do
    @unit = Unit.new
  end

  describe "#dead?" do
    it "returns false if unit health_point is > 0" do
      # now check to see if one is trainable
      # can jump right to the test since barracks start off with enough gold and food to train multiple peasants
      expect(@unit.dead?).to be_falsey
    end

    it "returns true if unit health_points is <= 0" do
      # Make the barracks believe it only has 4 food items left, even though it starts with 80
      # This is done by overwriting the `food` getter method
      # @unit.should_receive(:health_points).and_return(0)
      @unit.should_receive(:health_points).and_return(-10)
      # @barracks.should_receive(:food).and_return(4)
      expect(@unit.dead?).to be_truthy
    end
  end
end
