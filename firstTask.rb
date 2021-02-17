name = nil
surname = nil
age = nil

print "Enter your name please > "
name = gets.chomp

print "Enter your surname please > "
surname = gets.chomp

print "Enter your age please > "
age = gets.to_i

if age < 18
    puts "Hi, #{name} #{surname}. You are under 18 years old, but it's never too early to start learning to code"
else
    puts "Hi, #{name} #{surname}. It's time to get down to business!"
end