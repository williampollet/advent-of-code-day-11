require './octopus.rb'
require './cave.rb'
require 'matrix'

# example provided
# initial_energy_levels =
#   Matrix[
#     [5,4,8,3,1,4,3,2,2,3],
#     [2,7,4,5,8,5,4,7,1,1],
#     [5,2,6,4,5,5,6,1,7,3],
#     [6,1,4,1,3,3,6,1,4,6],
#     [6,3,5,7,3,8,5,4,7,8],
#     [4,1,6,7,5,2,4,6,4,5],
#     [2,1,7,6,8,4,1,7,2,1],
#     [6,8,8,2,8,8,1,1,3,4],
#     [4,8,4,6,8,4,8,5,5,4],
#     [5,2,8,3,7,5,1,5,2,6],
#   ]

# my puzzle
initial_energy_levels =
  Matrix[
    [5,6,5,1,3,4,1,4,5,2],
    [1,3,8,1,5,4,1,2,5,2],
    [1,8,7,8,4,3,5,2,2,4],
    [6,8,1,4,8,3,1,5,3,5],
    [3,8,8,3,5,4,7,3,8,3],
    [6,4,7,3,5,4,8,4,6,4],
    [1,8,8,5,8,3,3,6,5,8],
    [3,7,3,2,5,8,4,7,5,2],
    [1,8,8,1,5,4,6,1,2,8],
    [5,1,2,1,7,1,7,7,7,6],
  ]

cave = Cave.new(initial_energy_levels: initial_energy_levels)

# To check out 1st synchro step
while !cave.synchronized do
  cave.add_one_step
end
cave.display_status

## to count total number of flashes after step 100
# 100.times do
#   cave.add_one_step
# end
# cave.display_status
