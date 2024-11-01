require_relative 'student'

student1 = Student.new(first_name: "Олег", second_name: "Воевода", third_name: "", id: 1, telephone: "+78474232345", telegram: nil, email: "randommail@mail.ru", git: nil)
student2 = Student.new(first_name: "Андрей", second_name: "Христофоров", third_name: "Баламутович", id: 10, telephone: "+77543752543", telegram: "shyguy", email: nil, git: "Gite")

puts student1.info
puts student2.info
