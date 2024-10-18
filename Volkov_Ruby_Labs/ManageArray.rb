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
nil
end


def method_chooser(method_number, array_digits)
  case method_number
  when 1
    puts "минимальный элемнет: #{findMin(array_digits)}"
  when 2
    puts "максимальный элемент массива: #{findmax(array_digits)}"
  when 3
    puts "первый положительный элемент массива: #{firstpositive(array_digits)}"
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

method_chooser_input = ARGV[0].to_i
filePath=ARGV[1]

ARGV.clear

array_digits = readFile(filePath)
if array_digits
    result = method_chooser(method_chooser_input, array_digits)
  end
