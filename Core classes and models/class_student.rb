require_relative 'person'

class Student < Person
  attr_reader :telegram, :telephone, :email

# Конструктор для инициализации переменной студента, принимающая хэш определенных переменных, из которых обязательны составляющие: id, фамилия и имя
  def initialize(id: nil, second_name:, first_name:, last_name: nil, telephone: nil, telegram: nil, email: nil, git: nil)
    #Принцип наследования: вызов одноименного метода из родительского класса для переданных атрибутов
    super(second_name: second_name, first_name: first_name, last_name: last_name, id: id, git: git)
    set_contacts(telephone: telephone, telegram: telegram, email: email)
  end

  def set_contacts(telephone: nil, telegram: nil, email: nil)
    instance_variable_set("@telephone", telephone)
    instance_variable_set("@email", email)
    instance_variable_set("@telegram",telegram)
    protected_methods

    def telephone=(telephone)
      @telephone = telephone.to_s =~ /^\+\d{11}$/
    end

    def email=(email)
      @email = email.to_s =~ /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+.[a-zA-Z]{2,}$/
    end

    def telegram=(telegram)
      @telegram = telegram.to_s =~ /^@[a-zA-Z0-9_]{5,32}$/
    end

  end

  def contact_method
    return "Телефон: #{@telephone}" if @telephone
    return "Telegram: #{@telegram}" if @telegram
    return "Email: #{@email}" if @email
    "Контактная информация недоступна"
  end

  def getInfo
    contact_info = contact_method
    "Имя: #{first_name}, Фамилия: #{second_name}, Отчество: #{last_name} (Git: #{@git}, Связь - #{contact_info})"
  end

  def get_initials
    "#{first_name[0]}.#{last_name ? last_name[0] + '.' : ''}"
  end
end
