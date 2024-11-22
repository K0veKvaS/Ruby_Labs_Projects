require_relative 'person'

class Student < Person
  attr_accessor :id, :git

  def initialize(id:, second_name:, first_name:, last_name: nil, telephone: nil, telegram: nil, email: nil, git:)
    super(second_name: second_name, first_name: first_name, last_name: last_name)
    self.id = id
    set_contacts(telephone: telephone, telegram: telegram, email: email)
    self.git = git
  end
  def id=(id)
    @id = id.to_s =~ /^\d+$/ ? id : nil
  end

  def set_contacts(telephone: nil, telegram: nil, email: nil)
    self.telephone = telephone
    @telegram = telegram
    @email = email
    validate_contacts
  end

  def telephone=(telephone)
    if telephone.to_s =~ /^+d{11}$/
      @telephone = telephone
    end
  end

  def telegram=(telegram)
    if telegram.to_s =~ /^@[a-zA-Z0-9_]{5,32}$/
      @telegram = telegram
    end
  end

  def email=(email)
    if email.to_s =~ /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+.[a-zA-Z]{2,}$/
      @email = email
    end
  end

  def git=(git)
    @git = git.to_s =~ /^[a-zA-Z0-9_.+-]+$/ ? git : nil
  end

  def validate_contacts
    raise 'Необходимо указать хотя бы один контакт' if @telephone.nil? && @telegram.nil? && @email.nil?
  end

  def getInfo
    contact_info = contact_method
    "Имя: #{first_name}, Фамилия: #{second_name}, Отчество: #{last_name} (Git: #{@git}, Связь - #{contact_info})"
  end

end
