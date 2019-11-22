# Write a method that displays a 4-pointed diamond in an n x n grid, where n is an odd integer that is supplied as an argument to the method. You may assume that the argument will always be an odd integer.

=begin
Algorithm
set distance from center
use method to print first line to midline inclusive --> grid, distance
  set number of stars
  set stars to string
  puts string
use method to print after midline to end --> grid, distance
  set number of stars
  set stars to string
  puts string
=end

def set_rows(grid, distance)
  number_of_stars = grid - (distance * 2)
  stars = '*' * number_of_stars
  puts stars.center(grid)
end

def diamond(grid)
  distance_to_center = (grid - 1) / 2
  distance_to_center.downto(0) { |distance| set_rows(grid, distance) }
  1.upto(distance_to_center) { |distance| set_rows(grid, distance) }
end

diamond(3)
diamond(7)
diamond(9)
