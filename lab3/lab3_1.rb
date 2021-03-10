file_data = File.read("peoples.txt").split("\n")

def checkNum(str, num)
    n = str.length
    i = 0
    loop do
        if (i == n)
            break
        else
            line = str[i].split(" ")
            if (line[2].to_i == num)
                File.write("results.txt", str[i]+"\n", mode: "a")
            else
            end
            i = i + 1
        end 
    end
end

loop do
    puts "Введите необходимый возраст"
    num = gets.to_i
    case num
    when -1
        puts File.read("results.txt").split("\n")
        break
    else
        checkNum(file_data, num)

    end
    if (File.read("results.txt").split("\n").length == file_data.length)
        puts File.read("results.txt").split("\n")
        break
    else
    end
end