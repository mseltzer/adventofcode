file = File.open("input_2_1.txt")
file_data_array = file.readlines.map(&:chomp)

def count_em(string, substring)
  string.scan(/(?=#{substring})/).count
end

data_array = file_data_array.map do |line|
  line.delete(":").split(' ')
end

count = 0
data_array.each do |arr|
  min_max = arr[0].split("-")
  search_str = arr[1]
  string_to_search = arr[2]
  c = count_em(string_to_search,search_str)
  count = count+1 if c >= min_max[0].to_i && c <= min_max[1].to_i
end

file.close
print count