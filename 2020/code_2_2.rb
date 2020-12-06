file = File.open("input_2_1.txt")
file_data_array = file.readlines.map(&:chomp)

data_array = file_data_array.map do |line|
  line.delete(":").split(' ')
end

count = 0
data_array.each do |arr|
  min_max = arr[0].split("-")
  search_str = arr[1]
  string_to_search = arr[2]
  char_include = string_to_search[min_max[0].to_i-1]
  char_exclude = string_to_search[min_max[1].to_i-1]
  if (char_include == search_str || char_exclude == search_str) &&
      (char_include != search_str || char_exclude != search_str)
    count = count+1
  end
end

file.close
print count