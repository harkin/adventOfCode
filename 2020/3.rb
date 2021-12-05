lines = File.read("input/3.txt").split("\n")
line_length = lines.first.length

strategies = [
  [1, 1],
  [3, 1],
  [5, 1],
  [7, 1],
  [1, 2],
]

total_trees_hit = 1

strategies.each do |strategy|
  trees_hit = 0
  x = 0
  down = strategy[1]
  while down < lines.length
    x = (x + strategy[0]) % line_length
    if lines[down][x].eql?("#")
      trees_hit += 1
    end
    down += strategy[1]
  end
  total_trees_hit *= trees_hit
end

puts "trees hit: #{total_trees_hit}"
