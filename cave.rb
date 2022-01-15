class Cave
  def initialize(initial_energy_levels:)
    @grid = initialize_grid(initial_energy_levels)
    @current_step = 0
    @flash_count = 0
  end

  attr_accessor :grid, :current_step, :flash_count

  def add_one_step
    
  end 

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
  
  def display_status
    puts "\n",
         "🐙"*20,
         "At STEP = #{current_step}",
         "flash count so far: #{flash_count}",
         "Current energy levels : "
    display_energy_level
  end
    
  def display_energy_level
    grid.map do |octopus_row|
      print_octopus_row(octopus_row)
    end
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

  def initialize_grid(initial_energy_levels)
    grid = initial_energy_levels.map.with_index do |row, y|
      row.map.with_index do |value, x|
        Octopus.new(x_axis: x+1, y_axis: y+1, initial_energy_level: value)
      end
    end
  end
  
  def print_octopus_row(octopus_row)
    print "#{octopus_row.map {|octopus| octopus.energy_level}}\n"
  end
  
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
