class PassportValidityChecker2
  def initialize(file)
    f = File.open(file)
    @passport_array = f.readlines.map(&:chomp)
    @passports = []
  end

  def parse_line(line)
    line_array = line.split(" ")
    line_array.map { | field | field.split(":") }
  end
  # byr (Birth Year)
  # iyr (Issue Year)
  # eyr (Expiration Year)
  # hgt (Height)
  # hcl (Hair Color)
  # ecl (Eye Color)
  # pid (Passport ID)
  # cid (Country ID)
  def count_keys_with_values?(passport)
    counter_good_keys = 0
    keys = %w(byr iyr eyr hgt hcl ecl pid) #cid)
    passport.each do | field |
      if keys.include?(field[0])
        counter_good_keys = counter_good_keys + 1  if key_valid_value?(field[0], field[1])
      end
    end
    counter_good_keys == 7 ? true : false
  end

  def valid_passports
    counter = 0
    @passports.each do |passport|
      counter = counter + 1 if count_keys_with_values?(passport)
    end
    counter
  end

  def run
    line_builder = ""
    @passport_array.each do | line |
      if line.length == 0
        @passports << parse_line(line_builder)
        line_builder = ""
        next
      end
      line_builder = line_builder + " " + line
    end
    @passports << parse_line(line_builder) if line_builder != ""
    valid_passports
  end

  def four_digits_in_range?(value, min, max)
    value.length == 4 and value.to_i >= min and value.to_i <= max
  end

  def calculate_height?(value)
    height_measurement = value[-2, value.length]
    height_amount = value[0, value.length-2].to_i
    if height_measurement == 'cm'
      height_amount >= 150 and height_amount <= 193
    elsif height_measurement == 'in'
      height_amount >= 59 and height_amount <= 76
    else
      false
    end
  end

  def correct_hexidecimal?(value)
    value.tr!('#', '')
    value.to_i(16).to_s(16) == value.downcase
  end

  def correct_eye_color(value)
    %w(amb blu brn gry grn hzl oth).include?(value)
  end

  def correct_passport_id(value)
    value.length == 9
  end

  def key_valid_value?(key, value)
    case key
      when 'byr'
        four_digits_in_range?(value, 1920, 2002)
      when 'iyr'
        four_digits_in_range?(value, 2010, 2020)
      when 'eyr'
        four_digits_in_range?(value, 2020, 2030)
      when 'hgt'
        calculate_height?(value)
      when 'hcl'
        correct_hexidecimal?(value)
      when 'ecl'
        correct_eye_color(value)
      when 'pid'
        correct_passport_id(value)
    end
  end
end

vp = PassportValidityChecker2.new("input_4_1.txt").run

print vp