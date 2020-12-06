class HighestSeatFinder

  def initialize(file)
    f = File.open(file)
    @seat_array = f.readlines.map(&:chomp)
  end

  def calc_column(seat)
    column = seat[-3, seat.length]
    c = column.tr('L', '0').tr('R', '1')
    c.to_i(2)
  end

  def calc_row(seat)
    row = seat[0, seat.length-3]
    r = row.tr('F', '0').tr('B', '1')
    r.to_i(2)
  end

  def run
    decoded_seats = @seat_array.map do | seat |
      column = calc_column(seat)
      row = calc_row(seat)
      row * 8 + column
    end
    decoded_seats.sort.last
  end

end

high_seat = HighestSeatFinder.new("input_5_1.txt").run

print high_seat