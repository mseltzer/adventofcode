defmodule FuelCalculator do

  def format_input(str) do
      String.split(str, "\n", trim: true) |> Enum.map(&String.to_integer/1)
  end

  def fuel_cost(num) do
    Integer.floor_div( num, 3) - 2
  end

  def total_fuel_cost(num) do
    fuel = fuel_cost(num)
    if fuel < 1 do
      0
    else
      fuel + total_fuel_cost(fuel)
    end
  end

end

IO.puts "Running the day 1, part 2 of Advent 2019"
{:ok, contents} = File.read("input_1_1.txt")
answer1 = Enum.reduce(FuelCalculator.format_input(contents), 0, fn(num, acc) -> acc + FuelCalculator.fuel_cost(num) end)
IO.puts answer1
answer2 = Enum.reduce(FuelCalculator.format_input(contents), 0, fn(num, acc) -> acc + FuelCalculator.total_fuel_cost(num) end)
IO.puts answer2





