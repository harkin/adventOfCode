needed_nums = {}

lines = File.read("input/1.txt").split("\n")
lines.each do |line|
  line = line.to_i
  if needed_nums[line]
    puts "Part 1! number 1: #{needed_nums[line]}, number 2: #{line}, product: #{needed_nums[line] * line}"
  else
    needed_nums[2020 - line] = line
  end
end

triplets = {}

lines.each do |line|
  a_num = 2020 - line.to_i
  lines.each do |line2|
    line2 = line2.to_i
    if triplets[line2]
      puts "Part 2! number 1: #{triplets[line2]}, number 2: #{line2}, number 3: #{line}
            product: #{triplets[line2] * line2 * line.to_i}"
    else
      triplets[a_num - line2] = line2
    end
  end
  triplets = {}
end
