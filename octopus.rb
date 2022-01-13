class Octopus
  def initialize(x_axis:, y_axis:, energy_level:)
    @x_axis = x_axis
    @y_axis = y_axis
    @energy_level = energy_level
    @energy_increment = 0
  end

  attr_accessor :x_axis, :y_axis, :energy_level, :just_flashed, :energy_increment

  def age_up
    @energy_level += 1
  end

  def increment_energy
    @energy_increment += 1
  end
  
  def apply_energy_increment
    if @energy_level < 10 && (@energy_level + @energy_increment) >= 10
      @@nb_flash += 1
      @energy_level = 10
    else
      @energy_level += @energy_increment
    end

    @energy_increment = 0
  end

  def neighbor?(octopus)
    (x_axis - octopus.x_axis).abs <= 1 && (y_axis - octopus.y_axis).abs <= 1
  end

  def reset_energy_level
    @energy_level = 0 if @energy_level > 10
  end
end
