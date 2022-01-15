require './octopus.rb'
require './cave.rb'

# grid = (1..10).map do |x|
#   (1..10).map do |y|
#     Octopus.new(x_axis: x, y_axis: y, energy_level: rand(10))
#   end
# end

initial_energy_levels =[
[5,4,8,3,1,4,3,2,2,3],
[2,7,4,5,8,5,4,7,1,1],
[5,2,6,4,5,5,6,1,7,3],
[6,1,4,1,3,3,6,1,4,6],
[6,3,5,7,3,8,5,4,7,8],
[4,1,6,7,5,2,4,6,4,5],
[2,1,7,6,8,4,1,7,2,1],
[6,8,8,2,8,8,1,1,3,4],
[4,8,4,6,8,4,8,5,5,4],
[5,2,8,3,7,5,1,5,2,6],
]

cave = Cave.new(initial_energy_levels: initial_energy_levels)
cave.display_status

# 100.times do (i)
#   cave.cave_age_up
#   cave.display
# end

# grid = example.map.with_index do |row, y|
#   row.map.with_index do |value, x|
#     Octopus.new(x_axis: x+1, y_axis: y+1, energy_level: value)
#   end
# end


# @@nb_flash = 0
# cave = Cave.new(grid: grid)

# (0..100).each do |i|
#   puts
#   puts i
#   puts "########################################"
#   puts "########################################"
#   print cave.display_energy_level
#   cave.cave_age_up
  
#   while cave.energy_levels.include?(10) do
#     cave.implement_flashes
#     cave.increment_last_flashes
#   end
#   cave.reset_octopus  
#   puts
#   puts @@nb_flash  
# end
