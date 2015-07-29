class SeigeEngine < Unit
  def initialize(health_points = 400, attack_power = 50)
    @health_points = health_points
    @attack_power = attack_power
  end

  def attack!(enemy)
    unless dead?
      if enemy.class == SeigeEngine || enemy.class == Barracks 
        enemy.damage(attack_power*4) # barracks takes only half of damage passed
      elsif enemy.class == Footman || enemy.class == Peasant
        enemy.damage(0) # 
      else
        enemy.damage(attack_power)
      end
    end
  end

  def damage(dmg)
    @health_points -= (dmg/2).ceil
  end


end
  