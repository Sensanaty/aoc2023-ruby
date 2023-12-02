# frozen_string_literal: true

FILE_PATH = File.join(File.dirname(__FILE__), 'input')
INPUT = File.read(FILE_PATH)

### === Part 1 === ###
# Splits the input file, which is delimited by newlines, and scans for any digits per line. The scan returns an array of
# digits, so we simply return the 1st index position and the last index position, after which we run a simple inject
def trebuchet_calibration
  numbers = INPUT.split("\n").map do |line|
    scan = line.scan(/\d/)

    (scan[0] + scan[-1]).to_i
  end

  numbers.inject(:+)
end

puts "Part 1 solution: #{trebuchet_calibration}"
