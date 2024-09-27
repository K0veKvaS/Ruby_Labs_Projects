puts "теперь напишите число классное математическое: " #целое положительное хотя бы двухзначное
written_number = gets.chomp.to_i

#функция нахождения количество делителей делящихся на 3
def findDividers(written_number)
    count = 0
    i = 1  
    while i <= written_number
      if (i % 3 != 0 && written_number % i == 0)
        count += 1
      end
      i+=1
    end
     count
end


# найти минимальную нечетную цифру числа
def findMinnechet(written_number)
        min=10000
    while written_number!=0
        check=written_number % 10
        if check<min && check%2!=0 
        min=check
        end 
    written_number/=10
    end
    min
end

#взаимно простые
def checkproste(written_number)
    number=written_number

    array=[]
    while written_number!=0
    digit=written_number%10
    array.push(digit)
    written_number/=10
    end

    sum_digits = 0
    for i in 0...(array.length)
    sum_digits += array[i]
    end

    multiply_Digits = 1
    for i in 0...(array.length)
    multiply_Digits *= array[i]
    end

    dividers_array = []
    for i in 1..number
    if number % i == 0
        dividers_array.push(i)
    end
    end

    # Отбираем взаимно простые делители
    co_simple_dividers_array = []
    for i in 0...(dividers_array.length)
    d = dividers_array[i]

    a = d
    b = sum_digits
    while b != 0
        swap = b
        b = a % b
        a = swap
    end
    nod_sum = a

    a = d
    b = multiply_Digits
    while b != 0
        swap = b
        b = a % b
        a = swap
    end
    nod_multiply = a

    if nod_sum == 1 && nod_multiply != 1
        co_simple_dividers_array.push(d)
    end
    end

    final_sum = 0
    for i in 0...(co_simple_dividers_array.length)
    final_sum += co_simple_dividers_array[i]
    end

    final_sum
end


answer1=findDividers(written_number)
answer2=findMinnechet(written_number)
answer3=checkproste(written_number)

puts "находим делители числа делящихся на 3: #{answer1}"
puts "минимальная нечетная цифар числа: #{answer2}"
puts "Сумма делителей числа взаимно простых с суммой его цифр и не взаимно простых с произведением его цифр: #{answer3}"
