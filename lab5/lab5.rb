class CashMachine

    def initialize(balance = 100)
        @balance = balance
        File.write('balance.txt', @balance)
    end

    def deposit(num)
        if num < 0
            return "You can't deposit negative money!"
        else
            @balance += num
            File.write("balance.txt", @balance)
            return @balance.to_s
        end
    end
    
    def withdraw(num)
        if num < 0
            return "You can't withdraw negative money!"
        elsif num > @balance
            return "You haven't so much money on your balance!"
        else
            @balance -= num
            File.write("balance.txt", @balance)
            return @balance.to_s
        end

    end

    def balance
        return @balance.to_s
    end
end

cash = CashMachine.new

def http

    require 'socket'
    server = TCPServer.open(3000)

    loop do
        res = "HTTP/1.1 300 OK"
        client = server.accept
        response = client.gets
        method, url = response.split(" ")
        if method == "GET"
            url, num = url.split("?")
            if url == "/balance"
                res = "#{res} \n\n#{cash.balance}"
            elsif
                url == "/withdraw"
                res = "#{res} \n\n #{cash.withdraw(num.to_i)}"
            elsif
                url == "/deposit"
                res = "#{res} \n\n #{cash.deposit(num.to_i)}"
            elsif url == "/quit"
                res = "#{res} \n\nGood bye!"
                client.print res
                client.close()
                break
            else
                res = "HTTP/1.1 404\n\n Page Not Found"
            end
        end
        client.print res
        client.close()
    end
end

http
