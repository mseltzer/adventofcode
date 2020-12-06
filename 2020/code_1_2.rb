file = File.open("input_1_1.txt")
file_data_array = file.readlines.map(&:chomp).map(&:to_i)
file_data_array.sort!
solution = 0
file_data_array.each do |num|
  file_data_array.each do |num2|
    file_data_array.each do |num3|
      break if (num + num2 + num3) > 2020
      if (num + num2 + num3) == 2020
        solution = (num * num2 * num3)
        break
      end
    end
    break if solution != 0
  end
  break if solution != 0
end

file.close
print solution