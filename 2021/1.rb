lines = File.read("input/1.txt").split("\n").map(&:to_i)

increases = 0
window_increases = 0
curr = lines.first
last = nil
laster = nil
lastest = nil

lines.each do |line|
  if line > curr
    increases += 1
  end
  if last && laster && lastest && (curr + last + laster) > (last + laster + lastest)
    window_increases += 1
  end
  lastest = laster
  laster = last
  last = curr
  curr = line
end

puts "part 1 answer: #{increases}"
puts "part 2 answer: #{window_increases}"