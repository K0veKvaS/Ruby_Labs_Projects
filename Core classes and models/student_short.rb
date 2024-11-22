require_relative 'person'

class StudentShort < Person
  attr_reader :id, :git, :contact

  def initialize(id:, student: nil)
    if student.is_a?(Student)
      @id = student.id 
      super(second_name: student.second_name, first_name: student.first_name, last_name: student.last_name)
      @git = student.git
      @contact = student.send(:contact_method)

    end
  end
end
