class Cave
  def initialize(initial_energy_levels:)
    @grid = initialize_grid(initial_energy_levels)
    @current_step = 0
    @flash_count = 0
    @synchronized = false

    display_status
  end

  attr_accessor :grid, :current_step, :flash_count, :synchronized
  
  def display_status
    puts "\n",
         "🐙"*20,
         "At STEP = #{current_step}",
         "flash count so far: #{flash_count}",
         "is synchronized: #{synchronized}",
         "Current energy levels: "
    display_energy_level
  end

  def add_one_step
    @current_step += 1
    cave_age_up
    propagate_flashes
    update_flash_count
    @synchronized = uniq_value_count?
  end  
  
  private

  def initialize_grid(initial_energy_levels)
    grid = Matrix.build(10, 10) do |row, col|
      Octopus.new(
        x_axis: col + 1,
        y_axis: row + 1,
        initial_energy_level: initial_energy_levels[row, col],
      )
    end
  end
  
  def print_octopus_row_energy_level(octopus_row_vector)
    print "#{octopus_row_vector.map {|octopus| octopus.energy_level}.to_a}\n"
  end

  def cave_age_up
    grid.collect { |octopus| octopus.age_up }
  end

  def propagate_flashes
    loop do
      break if !tens?
      implement_next_flashes
      increment_last_flashes
    end  
    reset_octopus
  end

  def tens?
    grid.map { |octopus| octopus.energy_level }.to_a.flatten.include?(10)
  end
  
  def implement_next_flashes
    grid.map do |octopus|
      next if octopus.energy_level != 10
      upgrade_neighbors(octopus)
    end 
  end

  def upgrade_neighbors(octopus_sample)
    grid.map do |octopus|
      next if !octopus.neighbor?(octopus_sample)
      octopus.increment_energy
    end
  end

  def increment_last_flashes
    grid.map { |octopus| octopus.apply_energy_increment }
  end

  def display_energy_level
    grid.row_count.times {|i| print_octopus_row_energy_level(grid.row(i)) }
  end
  
  def reset_octopus
    grid.map { |octopus| octopus.reset_energy_level }
  end
  
  def update_flash_count
    @flash_count +=
      grid
        .to_a
        .flatten
        .map { |octopus| octopus.energy_level}
        .select{ |level| level == 0}
        .count
  end
      
  def uniq_value_count?
    grid.to_a.flatten.map { |octopus| octopus.energy_level}.uniq.count == 1
  end
end
