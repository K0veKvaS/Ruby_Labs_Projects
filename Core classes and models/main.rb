require_relative 'student'
require_relative 'student_short'

student1 = Student.new(id: 1, second_name: 'Бурбуляров', first_name: 'Олег', last_name: 'Викторович', telephone: '+79161234567', git: 'github.com', email: 'mail@m.ru')
  
puts student1.getInfo
  
student_short1 = StudentShort.new(id: 2, student: student1)
puts"\n"
puts "Краткая информация о студенте:"
puts student_short.getInfo
