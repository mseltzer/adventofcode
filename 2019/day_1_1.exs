IO.puts "Running the day 1, part 1 of Advent 2019"
{:ok, contents} = File.read("input_1_1.txt")
con = contents |> String.split("\n", trim: true) |> Enum.map(&String.to_integer/1)
answer = Enum.reduce(con, 0, fn(num, acc) -> acc + Integer.floor_div( num, 3) - 2 end)
IO.puts answer
