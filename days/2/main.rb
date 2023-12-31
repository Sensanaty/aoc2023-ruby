# frozen_string_literal: true

require_relative 'ascii'
cube

FILE_PATH = File.join(File.dirname(__FILE__), 'input')
INPUT = File.read(FILE_PATH)

### === Part 1 === ###

# General format that each round of the game follows with a capture group for the game ID
LINE_FORMAT = /^Game\s(\d+):\s.*$/

# The possible max quantity for each color
POSSIBLE_COLORS = { 'red' => 12, 'green' => 13, 'blue' => 14 }.freeze

def conundruming_cubes
  sum = 0

  INPUT.split("\n").each do |line|
    is_possible = true

    id = line.match(LINE_FORMAT)[1].to_i
    line.gsub!(/Game\s\d*:\s/, '')

    sets = line.split(';')
    sets.each do |set|
      games = set.split(',')
      cubes = Hash.new(0)

      games.each do |game|
        value, color = game.strip.split("\s")
        cubes[color] += value.to_i
      end

      cubes.each do |color, value|
        is_possible = false unless value <= POSSIBLE_COLORS[color]
      end
    end

    sum += id if is_possible
  end

  sum
end

puts "Part 1 solution: #{conundruming_cubes}"

### === Part 2 === ###

def minimum_cubology
  sum = 0

  INPUT.split("\n").each do |line|
    line.gsub!(/Game\s\d*:\s/, '')
    maximum = Hash.new(0)

    sets = line.split(';')

    sets.each do |set|
      games = set.split(',')

      games.each do |game|
        value, color = game.strip.split("\s")
        maximum[color] = [value.to_i, maximum[color]].max
      end
    end

    power = 1
    maximum.each_value do |value|
      power *= value.to_i
    end

    sum += power
  end

  sum
end

puts "Part 2 solution: #{minimum_cubology}"
