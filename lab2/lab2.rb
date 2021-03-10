def func1(num, word)
    if (word[word.length - 2, word.length - 1] == "CS")
      puts num ** word.length
    else puts word.reverse
    end
  end
  
  def func2
    puts "Сколько покемонов желаете добавлить?"
    nums = gets.to_i
    arrayPok = []
    nums.times do
      puts "Введите имя покемона"
      name_ = gets.chomp
      puts "Введите цвет покемона"
      color_ = gets.chomp
      arrayPok << {"name" => name_, "color" => color_}
    end
  puts "Полученный массив покемонов:"
  puts arrayPok
  end
  
  loop do
    puts "Введите 1, если хотите выполнить задачу №1, введите 2, если хотите выполнить задачу №2, введите -1 для выхода"
    n = gets.to_i
    if n == 1
      puts "Введите число > "
      number = gets.to_i
      puts "Введите слово > "
      word = gets
      func1(number, word)
    elsif n == 2
      func2
    elsif n == -1
      break
    else 
      puts "Вы ввели неправильное значение"
    end
  end