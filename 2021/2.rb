lines = File.read("input/2.txt").split("\n")

forward = 0
depth = 0

lines.each do |line|
  command, value = line.split(" ")

  case command
  when "forward"
    forward += value.to_i
  when "down"
    depth += value.to_i
  when "up"
    depth -= value.to_i
  end
end

puts "part 1: #{forward * depth}"

forward = 0
depth = 0
aim = 0

lines.each do |line|
  command, value = line.split(" ")

  case command
  when "forward"
    forward += value.to_i
    depth += aim * value.to_i
  when "down"
    aim += value.to_i
  when "up"
    aim -= value.to_i
  end
end

puts "part 2: #{forward * depth}"
