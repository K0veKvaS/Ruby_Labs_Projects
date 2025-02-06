require_relative 'Class_Student'
require_relative 'Student_Short'
require_relative 'Person'  
# Создаем объект класса Person
person = Person.new(id: 1, first_name: 'Олег', second_name: 'Воевода', third_name: 'Воевода')
puts "Информация о персонаже:"
puts "ID: #{person.id}, ФИО: #{person.first_name} #{person.second_name} #{person.third_name}"

# объект класса Student
student = Student.new(id: 2, first_name: 'Олег', second_name: 'Бурбуляров', third_name: 'Викторович', telephone: '+7(918)333-21-14', email: 'voevoda@gmail.ru', git: 'https://github.com/voevoda227')
puts "\nИнформация о студенте:"
puts student.info
student.set_contacts(telegram: '@Voet', git: 'https://github.com/voevoda227', email: 'voevoda@gmail.ru')
puts student.info
puts "=-=-=-=-=-=-=-=-=-="
puts "Прошел валидацию." if student.validate?
puts "=-=-=-=-=-=-=-=-=-="
puts "Студент имеет контактную информацию: #{student.has_contact_info?}"
puts "Студент имеет Git: #{student.has_git?}"
puts "Контактная информация студента: #{student.contact_info}"
puts "Git студента: #{student.git}"
puts "=-=-=-=-=-=-=-=-=-="
puts "Краткая информация о студенте: \n#{student.get_info}"

#объект класса student_short
student_short = Student_short.initialize_from_string(3, "Дембелев О.В.; Тел.: +7(939)218-65-32; Git: https://github.com/Dumbelev")
puts"\n"
puts "Информация о студенте из Student_short:"
puts "ID: #{student_short.id}, Имя и инициалы: #{student_short.name_and_initials}, Контакт: #{student_short.contact}, #{student_short.git}"
puts "Прошел валидацию" if student_short.validate?
puts "Инициализация short студента через объект родительского класса:"
short_dem = Student_short.initialize_from_student(student)
puts "ID: #{short_dem.id}, Имя и инициалы: #{short_dem.name_and_initials}, Контакт: #{short_dem.contact}, Гит: #{short_dem.git}"
