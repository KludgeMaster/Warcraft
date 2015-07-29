class Barracks
  attr_accessor :gold, :food, :lumber, :health_points
  
  def initialize (gold=1000,food=80, lumber=500,health_points=500)
    @gold = gold
    @food = food
    @lumber = lumber
    @health_points = health_points
  end

  def can_train_footman?
    gold >=135 && food >=2
  end

  def train_footman
    if can_train_footman?
      @gold -= 135
      @food -= 2  
      Footman.new
    end
  end

  def train_peasant
    if can_train_peasant?
      @gold -= 90
      @food -= 5
      Peasant.new
    end
  end

  def can_train_peasant?
    gold >= 90 && food >= 5
  end

  def train_seige_engine
    if can_train_seige_engine?
      @gold -= 200
      @food -= 3
      @lumber -=60
      SeigeEngine.new
    end
  end

  def can_train_seige_engine?
    gold >= 200 && food >= 3 && lumber >=60
  end

  def damage(dmg)
    @health_points -= (dmg/2).ceil
  end



end


