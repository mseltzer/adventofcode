defmodule ArrayAccessor do

  def format_input(str) do
      String.split(str, ",", trim: true) |> Enum.map(&String.to_integer/1)
  end

  # def fuel_cost(num) do
  #   Integer.floor_div( num, 3) - 2
  # end

  # def total_fuel_cost(num) do
  #   fuel = fuel_cost(num)
  #   if fuel < 1 do
  #     0
  #   else
  #     fuel + total_fuel_cost(fuel)
  #   end
  # end

end

IO.puts "Running the day 2, part 1 of Advent 2019"
{:ok, contents} = File.read("input_2_1.txt")
# IO.puts contents
array_content = ArrayAccessor.format_input(contents) |> 
IO.puts array_content
