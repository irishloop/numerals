# require 'pry'

input = ARGV[0].to_i
output = ""
numerals = Hash.new
numerals = { "M" => 1000, "D" => 500, "C" => 100, "L" => 50, "X" => 10, "V" => 5, "I" => 1}

output += "M" * (input / 1000)

$remainder = input % 1000

def getWholeNumerals(nextNumeral, numerals)
  ret = ""
  if $remainder >= numerals[nextNumeral]
    ret += (nextNumeral * ($remainder / numerals[nextNumeral])).to_s
    $remainder = $remainder % numerals[nextNumeral]
    # puts "Remainder is " + $remainder.to_s
  end
  return ret
end

def getPrefixedNumerals(nextNumeral, prefix, numerals)
  ret = "" 
  if $remainder >= (numerals[nextNumeral] - numerals[prefix])
    ret += (prefix + nextNumeral).to_s
    $remainder -= (numerals[prefix] + numerals[nextNumeral])
    # puts "Remainder is " + $remainder.to_s
  end
  return ret
end

while $remainder > 0
  output += getPrefixedNumerals('M', 'C', numerals)
  output += getWholeNumerals('D', numerals)
  output += getPrefixedNumerals('D', 'C', numerals)
  output += getWholeNumerals('C', numerals)
  output += getPrefixedNumerals('C', 'X', numerals)
  output += getWholeNumerals('L', numerals)
  output += getPrefixedNumerals('L', 'X', numerals)
  output += getWholeNumerals('X', numerals)
  output += getPrefixedNumerals('X', 'I', numerals)
  output += getWholeNumerals('V', numerals)
  output += getPrefixedNumerals('V', 'I', numerals)
  output += getWholeNumerals('I', numerals)
end

# binding.pry

puts output

