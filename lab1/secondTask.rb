num1 = nil
num2 = nil

puts "Enter a first number please"
num1 = gets.to_i

puts "Enter a second number please"
num2 = gets.to_i

if (num1 == 20) || (num2 == 20)
    puts 20
else
    puts num1 + num2
end