input = ARGV[0].to_i
output = ""
numerals = { "M" => 1000, "D" => 500, "C" => 100, "L" => 50, "X" => 10, "V" => 5, "I" => 1}

output += "M" * (input / 1000)

remainder = input % 1000

if remainder >= 900
  output += "CM"
  remainder -= 900
end

if remainder >= 500
  output += "D"
  remainder -= 500
end

if remainder >= 400
  output += "CD"
  remainder -= 400
end

if remainder >= 100
  output += "C" * (remainder / 100)
  remainder = remainder % 100
end

if remainder >= 90
  output += "XC"
  remainder -= 90
end

if remainder >= 50
  output += "L"
  remainder -= 50
end

if remainder >= 40
  output += "XL"
  remainder -= 40
end

if remainder >= 10
  output += "X" * (remainder / 10)
  remainder = remainder % 10
end

if remainder >= 9
  output += "IX"
  remainder -= 9
end

if remainder >= 5
  output += "V"
  remainder -= 5
end

if remainder >= 4
  output += "IV"
  remainder -= 4
end

if remainder >= 1
  output += "I" * remainder
end

puts output

