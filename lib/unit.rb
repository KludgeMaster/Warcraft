

class Unit
#  attr_reader :health_points, :attack_power
  attr_reader :health_points, :attack_power

  def initialize(health_points = 10, attack_power = 0)
    @health_points = health_points
    @attack_power = attack_power
  end

  def attack!(enemy)
    enemy.damage(attack_power) unless dead?
  end

  def damage(dmg)
    @health_points -= dmg unless dead?
  end

  def dead?
    health_points <= 0
  end


end
