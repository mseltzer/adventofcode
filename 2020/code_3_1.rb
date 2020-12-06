file = File.open("input_3_1.txt")
file_data_array = file.readlines.map(&:chomp)
row_char_count = file_data_array.first.length

move_right = 3
tree_count = 0
position_right = 0

file_data_array.each do | line |
  array_access_point = position_right%row_char_count
  tree_count = tree_count + 1 if line[array_access_point] == '#'
  position_right = position_right + move_right
end

print tree_count