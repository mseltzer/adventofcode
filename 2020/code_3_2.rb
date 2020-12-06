file = File.open("input_3_1.txt")
file_data_array = file.readlines.map(&:chomp)

def trees_hit (toboggan_slope, moves)
  tree_count = 0
  position_right = 0
  slope_width = toboggan_slope.first.length

  toboggan_slope.each_with_index do | line, index |
    array_access_point = position_right % slope_width
    if index % moves[1] == 0
      tree_count = tree_count + 1 if (line[array_access_point] == '#')
      position_right = position_right + moves[0]
    end
  end

  tree_count
end

tree_count_array = []
movement = [[1,1],[3,1],[5,1],[7,1],[1,2]]

movement.each_with_index do | moves, index |
  tree_count_array[index] = trees_hit(file_data_array, moves)
end

total_trees = 1
tree_count_array.each { |trees| total_trees = total_trees * trees }

print total_trees
