if (File.exists?("balance.txt"))
    balance = File.read("balance.txt")
else
    File.write("balance.txt", "100")
    balance = File.read("balance.txt")
end


def balance
    return File.read("balance.txt")
end

def withdraw(num)
    balance_ = File.read("balance.txt").to_i
    if num > balance_
        return "You haven't so much money on your account!"
    elsif num < 0
        return "You can't withdraw negative money!"
    else
        balance_ -= num
        File.write("balance.txt", balance_)
        return "The operation was successful! Your ccount balance = " + balance_.to_s
    end
end

def deposit(num)
    balance_ = File.read("balance.txt").to_i
    if num < 0
        return "You can't deposit negative money!"
    else
        balance_ += num
        File.write("balance.txt", balance_)
        return "The operation was successful! Your ccount balance = " + balance_.to_s
    end
end

def quit
    "Good bye!"
end

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
                res = "#{res} \n\n#{balance}"
            elsif
                url == "/withdraw"
                res = "#{res} \n\n #{withdraw(num.to_i)}"
            elsif
                url == "/deposit"
                res = "#{res} \n\n #{deposit(num.to_i)}"
            elsif url == "/quit"
                res = "#{res} \n\n#{quit}"
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