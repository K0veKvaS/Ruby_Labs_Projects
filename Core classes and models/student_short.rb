require_relative 'Person'

class Student_short < Person
  attr_accessor :id

  def self.from_student(student)
    student_short = new(
      second_name: student.surname_initials.split[0],
      first_name: student.surname_initials.split[1][0],
      third_name: student.surname_initials.split[1][2],
      git: student.git,
      telephone: student.telephone,
      telegram: student.telegram,
      email: student.email
    )
    student_short
  end

  def self.from_info_string(id, info_string)
    second_name, first_name, third_name, telephone, telegram, email, git = parse_info_string(info_string)

    student_short = new(
      second_name: second_name,
      first_name: first_name,
      third_name: third_name,
      git: git,
      telephone: telephone,
      telegram: telegram,
      email: email
    )
    student_short.id = id
    student_short
  end

  def self.parse_info_string(info_string)
    details = info_string.split(';')
    details.map(&:strip) 
  end

  def to_s
    output = []
    output << "ID: #{@id}" if @id
    output << super
    output.join("; ")
  end

  private_class_method :new

  def initialize(second_name:, first_name:, third_name:, git:, telephone: nil, telegram: nil, email: nil)
    super(second_name: second_name, first_name: first_name, third_name: third_name, git: git, telephone: telephone, telegram: telegram, email: email)
  end
end