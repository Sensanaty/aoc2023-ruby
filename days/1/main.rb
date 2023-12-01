# frozen_string_literal: true

FILE_PATH = File.join(File.dirname(__FILE__), 'input')

### === Part 1 === ###
def trebuchet_calibration
  input = File.read(FILE_PATH)

  numbers = input.split("\n").map do |line|
    scan = line.scan(/\d/)

    (scan[0] + scan[-1]).to_i
  end

  numbers.inject(:+)
end

puts "Part 1 solution: #{trebuchet_calibration}"
