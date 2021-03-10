const_balance = 100

def deposit
    puts "Введите сумму которую хотите внести на счёт (сумма должна быть больше нуля)"
    value = gets.to_i
    if (value > 0)
        bal = File.read("balance.txt").to_i
        File.write("balance.txt", value+bal)
        puts "Операция успешно выполнена"
        puts "Ваш баланс = " + File.read("balance.txt")
    else
        puts "Вы ввели отрицательное или нулевое число"
    end
end

def withdraw
    puts "Введите сумму которую хотите снять со счёта (сумма должна быть больше нуля и меньше либо равно текущему балансу)"
    value = gets.to_i
    bal = File.read("balance.txt").to_i
    if (value > 0 && value <= bal)
        File.write("balance.txt", bal - value)
        puts "Операция успешно выполнена"
        puts "Ваш баланс = " + File.read("balance.txt")
    else
        puts "Вы ввели отрицательное или нулевое число, или число больше вашего текущего баланса"
    end
end

loop do
    if (File.exists?("balance.txt"))
        balance = File.read("balance.txt")
    else
        balance = const_balance
    end

    puts "Для внесения денег на счёт введите 'D'"
    puts "Для вывода средств со счёта введите 'W'"
    puts "Для проверки баланса введите 'B'"
    puts "Для ввыхода из системы введите 'Q'"

    choice = gets.chomp.upcase
    if (choice == "D")
        deposit
    elsif (choice == "W")
        withdraw
    elsif (choice == "B")
        puts File.read("balance.txt")
    elsif (choice == "Q")
        break
    else
        puts "Вы ввели неверный символ"
    end

end