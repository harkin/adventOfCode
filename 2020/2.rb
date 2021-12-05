lines = File.read("input/2.txt").split("\n")

valid_passwords_under_first_scheme = 0
valid_passwords_under_second_scheme = 0
lines.each do |line|
  parts = line.split(" ")
  bounds = parts.first.split("-")
  lower = bounds.first.to_i
  upper = bounds.last.to_i
  letter = parts[1][0]
  password = parts.last

  count = password.count(letter)
  if count >= lower && count <= upper
    valid_passwords_under_first_scheme += 1
  end

  if (password[lower - 1].eql?(letter) && !password[upper - 1].eql?(letter)) ||
    (!password[lower - 1].eql?(letter) && password[upper - 1].eql?(letter))
    valid_passwords_under_second_scheme += 1
  end
end

puts "part 1: #{valid_passwords_under_first_scheme}"
puts "part 2: #{valid_passwords_under_second_scheme}"
