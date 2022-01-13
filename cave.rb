class Cave
  def initialize(grid:)
    @grid = grid
  end

  attr_accessor :grid

  def cave_age_up
    grid.each do |row|
      row.each do |octopus|
        octopus.age_up
      end
    end
  end

  def energy_levels
    grid.map do |row|
      row.map do |octopus|
        octopus.energy_level
      end
    end.flatten
  end
  
  def display_energy_level
    grid.map do |row|
      row.map do |octopus|
        octopus.energy_level
      end.join(' • ')
    end.join("\n")
  end

  def display_energy_increment
    grid.map do |row|
      row.map do |octopus|
        octopus.energy_increment
      end.join(' • ')
    end.join("\n")
  end

  def implement_flashes
    grid.each do |row|
      row.each do |octopus|
        if octopus.energy_level == 10
          upgrade_neighbors(octopus)
        end
      end
    end 
  end

  def reset_octopus
    grid.each do |row|
      row.each do |octopus|
        octopus.reset_energy_level
      end
    end 
  end

  def increment_last_flashes
    grid.each do |row|
      row.each do |octopus|
        octopus.apply_energy_increment
      end
    end 
  end

  private

  def upgrade_neighbors(octopus_sample)
    grid.each do |row|
      row.each do |octopus|
        if octopus.neighbor?(octopus_sample)
          octopus.increment_energy
        end
      end
    end
  end
end
