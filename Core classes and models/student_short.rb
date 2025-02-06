require_relative 'Class_Student'

class Student_short < Student
  attr_reader :name_and_initials, :contact

  def initialize(args)
    @id = args[:id]
    @name_and_initials = args[:name_and_initials] if valid_field?(name_and_initials, args[:name_and_initials])
    @contact = args[:contact] if valid_field?(email, args[:contact]) || valid_field?(telegram, args[:contact]) || valid_field?(telephone, args[:contact])
    @git = args[:git] if valid_field?(git, args[:git])
  end

  def self.initialize_from_student(student)
    id = student.id
    name_and_initials = student.full_name_with_initials
    contact = student.contact_info
    git = student.git
    new(id: id, name_and_initials: name_and_initials, contact: contact, git: git)
  end
  
  def self.initialize_from_string(id, string)
    data = string.split('; ')
    new(id: id, name_and_initials: data[0], contact: data[1], git: data[2])
  end
  
  def validate?
    !@contact.nil? || has_git?
  end
  private_class_method :new
end
