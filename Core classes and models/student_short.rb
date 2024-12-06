require_relative 'student'

class StudentShort < Student
  attr_reader :git, :id, :initials, :contact

  def initialize(student: nil, id: nil, info_string: nil)
    if student.is_a?(Student)
      super(second_name: student.second_name, first_name: student.first_name, last_name: student.last_name,
            telephone: student.telephone, telegram: student.telegram, email: student.email, git: student.git)
      @git = student.git
      @id = student.id
      @initials = student.get_initials 
      @contact = student.contact_method 
    elsif info_string
      parse_info_string(info_string)
      @id = id
      @contact = "Контактная информация недоступна" 
    end
  end

  # Метод для парсинга строки информации
  def parse_info_string(info_string)
    parts = info_string.split(' ')
    self.second_name = parts[0]
    self.first_name = parts[1]
    self.last_name = parts[2] if parts.length > 2
  end

  def getInfo
    "ID: #{@id}, Фамилия и инициалы: #{initials}, Git: #{@git}, контакты: #{@contact}"
  end
end
