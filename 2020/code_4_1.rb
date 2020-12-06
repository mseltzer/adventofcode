class PassportValidityChecker1
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
      counter_good_keys = counter_good_keys + 1 if keys.include?(field[0])
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

end

vp = PassportValidityChecker1.new("input_4_1.txt").run

print vp