class CashMachine

    if !(File.exists?('balance.txt'))
        File.write('balance.txt','100')
    end

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

    def step
        puts "\n"
        puts "Для внесения денег на счёт введите 'D'"
        puts "Для вывода средств со счёта введите 'W'"
        puts "Для проверки баланса введите 'B'"
        puts "Для ввыхода из системы введите 'Q'"
        puts "\n"
        return choice = gets.chomp.upcase
    end

    def init
        loop do
            puts "\n"
            puts "Для внесения денег на счёт введите 'D'"
            puts "Для вывода средств со счёта введите 'W'"
            puts "Для проверки баланса введите 'B'"
            puts "Для ввыхода из системы введите 'Q'"
            puts "\n"
            choice = gets.chomp.upcase

            if (choice == "D")
                self.deposit
            elsif (choice == "W")
                self.withdraw
            elsif (choice == "B")
                puts File.read("balance.txt")
            elsif (choice == "Q")
                break
            else
                puts "Вы ввели неверный символ"
            end
        end
    end    
end

cash = CashMachine.new
cash.init