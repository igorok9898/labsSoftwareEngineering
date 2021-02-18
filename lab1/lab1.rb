def task1
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
end
    
def task2
    puts "Enter a first number please"
    num1 = gets.to_i
    
    puts "Enter a second number please"
    num2 = gets.to_i
    
    if (num1 == 20) || (num2 == 20)
        puts 20
    else
        puts num1 + num2
    end
end
    
loop do
    puts "Print 1 if you want to check Task 1, print 2 if you want to check Task 2, print -1 if you want to quit"
    choice = gets.to_i
    if choice == 1
        task1
    elsif choice == 2
        task2
    elsif choice == -1
        break
    else
        puts "You're print not valid data"
    end
end