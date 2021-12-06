lines = File.read("input/3.txt").split("\n")
char_maps = lines.map(&:chars)

def most_common_character(lines)
  lines.sum { |d| d.to_i }.to_f / lines.length >= 0.5 ? "1" : "0"
end

gamma_rate = char_maps.transpose.map { |a| most_common_character(a) }.join.to_i(2)
epsilon_rate = gamma_rate ^ 0b111111111111

puts "part 1: #{gamma_rate * epsilon_rate}"

oxygen_char_maps = char_maps.clone
(0..char_maps[0].length).each do |index|
  f = oxygen_char_maps.transpose[index]
  mcc = most_common_character(f)
  oxygen_char_maps.select! { |line| line[index].eql?(mcc) }
  if oxygen_char_maps.length == 1
    break
  end
end

co2_char_maps = char_maps.clone
(0..char_maps[0].length).each do |index|
  f = co2_char_maps.transpose[index]
  mcc = most_common_character(f)
  co2_char_maps.reject! { |line| line[index].eql?(mcc) }
  if co2_char_maps.length == 1
    break
  end
end

puts "part 2: #{oxygen_char_maps.join.to_i(2) * co2_char_maps.join.to_i(2)}"