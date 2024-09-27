def findMin(array)
  min=array[0]
  for i in 0...array.length do
      if array[i]<min
          min=array[i]
      end
  end
  min
end

def findmax(array)
  max=array[0]
  for i in 0...array.length do
      if array[i]>max
          max=array[i]
      end
  end
  max
end

def firstpositive(array)
  for i in 0...array.length do
      if array[i]>0 then 
          return array[i]
      end
  end 
end


def method_chooser(method_number, array_digits)
  case method_number
  when 1
    findMin(array_digits)
  when 2
    findmax(array_digits)
  when 3
      firstpositive(array_digits)
  else
    puts "ошибка. Выберите от 1 до 3."
    nil
  end
end

def readFile(file_path)
  if File.exist?(file_path)
    File.read(file_path).split(',').map(&:to_i)
  else
    puts "Файл не найден: #{file_path}"
    nil
  end
rescue StandardError => e
  puts "Произошла ошибка: #{e.message}"
  nil
end


array=[1,2,3,4,5,6,7,8,9,10]
answer4=findMin(array)
answer5=findmax(array)
answer6=firstpositive(array)

puts "минимальный элемент массива: #{answer4}"
puts "максимальный элемент массива: #{answer5}"
puts "первый положительный элемент массива: #{answer6}"

puts "выберите метод для преобразования массива(от 1 до 3):"
methodChooser = gets.chomp.to_i

puts "теперь запишите путь файла, откуда будет считываться массив: "
filePath = gets.chomp

array_digits = readFile(filePath)
if array_digits
    result = method_chooser(methodChooser, array_digits)
    puts "Результат: #{result.inspect}" if result
  end
