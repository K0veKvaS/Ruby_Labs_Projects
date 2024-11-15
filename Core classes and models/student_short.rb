require_relative 'Person'

class Student_short < Person
  attr_reader :id, :surname_initials, :git, :contact

  def initialize(student)
    @id = student.id
    @surname_initials = student.surname_initials
    @git = student.git
    @contact = student.contact_choose
  end

  def initialize_from_info_string(id, info_string)
    details = parse_info_string(info_string)
    @id = id
    @surname_initials = "#{details[:second_name]} #{details[:first_name][0]}.#{details[:third_name][0]}."
    @git = details[:git]
    @contact = contact_choose(details)
  end

  def getInfo
    "#{@surname_initials}; Git: #{@git}; Contact: #{@contact}"
  end

  private

  def parse_info_string(info_string)
    details = info_string.split(';').map(&:strip)
    {
      first_name: details[0],
      second_name: details[1],
      third_name: details[2],
      git: details[3]
    }
  end

  def contact_choose(details)
    if details[:telephone]
      "telephone: #{details[:telephone]}"
    elsif details[:telegram]
      "Telegram: #{details[:telegram]}"
    elsif details[:email]
      "Email: #{details[:email]}"
    else
      "Ни один из контактов не указан."
    end
  end
end
