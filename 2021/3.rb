lines = File.read("input/3.txt").split("\n")

gamma_rate = lines.map(&:chars).transpose.map { |a| a.sum { |d| d.to_i }.to_f / a.length > 0.5 ? 1 : 0 }.join.to_i(2)
epsilon_rate = gamma_rate ^ 0b111111111111

puts gamma_rate * epsilon_rate