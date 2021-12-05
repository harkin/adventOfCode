require "pry"

def hash_of_letter_occurrences(line)
  hash = {}

  line.chars.each do |character|
    hash[character] = hash[character].nil? ? 1 : hash[character] + 1
  end

  hash
end

count_twos = 0
count_threes = 0

lines = File.read("input/2.txt").split("\n")
lines.each do |line|
  hash = hash_of_letter_occurrences(line)
  counts = hash.values
  count_twos += 1 if counts.any? {|v| v.eql?(2)}
  count_threes += 1 if counts.any? {|v| v.eql?(3)}
end

checksum = count_threes * count_twos
puts checksum

lines.each do |line|
  chars = line.chars
  lines.each do |other_line|
    differing_chars = 0
    chars.each_with_index do |c, i|
      unless other_line[i].eql?(c)
        differing_chars += 1
      end
    end
    if differing_chars.eql?(1)
      puts "line: #{line}, other_line: #{other_line}"
      return
    end
  end
end
