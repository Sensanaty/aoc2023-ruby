# frozen_string_literal: true

require_relative 'ascii'
trebuchet

FILE_PATH = File.join(File.dirname(__FILE__), 'input')
INPUT = File.read(FILE_PATH)

### === Part 1 === ###

# Splits the input file, which is delimited by newlines, and scans for any digits per line. The scan returns an array of
# digits, so we simply return the 1st index position and the last index position, after which we simply sum the result
def trebuchet_calibration
  numbers = INPUT.split("\n").map do |line|
    scan = line.scan(/\d/)

    (scan[0] + scan[-1]).to_i
  end

  numbers.sum
end

puts "Part 1 solution: #{trebuchet_calibration}"

### === Part 2 === ###

NUMBER_MAP = {
  'zero' => 0,
  'one' => 1,
  'two' => 2,
  'three' => 3,
  'four' => 4,
  'five' => 5,
  'six' => 6,
  'seven' => 7,
  'eight' => 8,
  'nine' => 9
}.freeze

##
# Uses a dictionary of the number words to do the same as above, scan the input for either a digit or one of the
# matching words, joins them up together and sums them all up
def refined_trebuchet_calibration
  # We have to use a positive lookahead since some words can overlap, for example oneight is both one and eight
  numeric_regex = /(?=(\d|#{NUMBER_MAP.keys.join('|')}))/

  numbers = INPUT.split("\n").map do |line|
    scan = line.scan(numeric_regex).values_at(0, -1).flatten.map do |number|
      NUMBER_MAP[number] || number
    end

    scan.join.to_i
  end

  numbers.sum
end

puts "Part 2 solution: #{refined_trebuchet_calibration}"
