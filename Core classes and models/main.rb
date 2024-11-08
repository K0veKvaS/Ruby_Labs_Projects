require_relative 's1'

student1 = Student.new(first_name: "Олег", second_name: "Воевода", third_name: "Олегович", id: 1, git: "Gite")
student2 = Student.new(first_name: "Андрей", second_name: "Христофоров", third_name: "Баламутович", id: 10, git: "")
student1.set_contacts(telephone: "+77543752543", telegram: "@shyguy", email: "imgonna@no.ru")
if student1.validate()
  puts"\n"
  puts"у студента #{student1.first_name()} #{student1.second_name()} есть контакты(т.е. почта, телега и почта)"
else
  puts"у студента #{student1.first_name()} #{student1.second_name()} ничего нет."
end
puts student1.info
puts student2.info
