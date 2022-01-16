class Octopus
  def initialize(x_axis:, y_axis:, initial_energy_level:)
    @x_axis = x_axis
    @y_axis = y_axis
    @energy_level = initial_energy_level
    @energy_increment = 0
  end

  attr_accessor :x_axis, :y_axis, :energy_level, :energy_increment

  def age_up
    @energy_level += 1
  end

  def increment_energy
    @energy_increment += 1
  end
  
  def apply_energy_increment
    @energy_level < 10 && (@energy_level + @energy_increment) >= 10 ?
      @energy_level = 10 :
      @energy_level += @energy_increment

    @energy_increment = 0
  end

  def neighbor?(octopus)
    (x_axis - octopus.x_axis).abs <= 1 && (y_axis - octopus.y_axis).abs <= 1
  end

  def reset_energy_level
    @energy_level = 0 if @energy_level > 10
  end
end
