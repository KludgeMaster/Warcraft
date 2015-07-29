require_relative 'spec_helper'

describe Barracks do
  before do
    @barracks = Barracks.new
  end

  describe "#damage" do
    it "should take damage a half of attack power received" do
      @barracks.damage(100)
      expect(@barracks.health_points).to eq(450)
    end
  end

end
