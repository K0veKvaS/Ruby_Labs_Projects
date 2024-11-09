require_relative 'Person'

class Student < Person
  attr_reader :id, :first_name, :second_name, :third_name, :telephone, :telegram, :email, :git
  def initialize(first_name:, second_name:, third_name:, id: nil, git:)
    self.first_name = first_name 
    self.second_name = second_name 
    self.third_name = third_name 
    self.id = id
    self.git = git
  end
    def set_contacts(telephone: nil, telegram: nil, email: nil)
    self.telephone=(telephone) 
    self.telegram=(telegram) 
    self.email=(email)
    @contact = set_contact(telephone, telegram, email) 
  end

  def info 
    "ID: #{@id || 'Не указано'}, ФИО: #{@first_name} #{@second_name} #{@third_name}, Контакты: #{@contact}, Git: #{@git}"
  end

  def getInfo
    "#{surname_initials}; Git: #{@git}; Contact: #{contact_choose}"
  end

  def surname_initials
    "#{@second_name} #{@first_name[0]}.#{@third_name[0]}."
  end

  def contact_choose
    if @telephone
      "telephone: #{@telephone}"
    elsif @telegram
      "Telegram: #{@telegram}"
    elsif @email
      "Email: #{@email}"
    else
      "Ни один из контактов не указан."
    end
  end
  
  def validate
    validate_contact_presence
  end

  def validate_contact_presence
    !@telephone.nil? || !@telegram.nil? || !@email.nil?
  end

  private

  def telephone=(telephone)
    @telephone = telephone.to_s =~ /^\+\d{11}$/ ? third_name : nil
  end

  def first_name=(first_name)
    @first_name = first_name.to_s =~ /^[A-Za-zА-Яа-яЁё'-]+$/ ? first_name : nil
  end

  def second_name=(second_name)
    @second_name = second_name.to_s =~ /^[A-Za-zА-Яа-яЁё'-]+$/ ? second_name : nil
  end

  def third_name=(third_name)
    @third_name = third_name.to_s =~ /^[A-Za-zА-Яа-яЁё'-]+$/ ? third_name : nil
  end

  def telegram=(telegram)
    @telegram = telegram.to_s =~ /^@[a-zA-Z0-9_]{5,32}$/ ? telegram : nil
  end

  def email=(email)
    @email = email.to_s =~ /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]{2,})\z/ ? email : nil
  end

  def git=(git)
    @git = git.to_s =~ /^[a-zA-Z0-9_.+-]+$/ ? git : nil
  end

  def id=(id)
    @id = id.to_s =~ /^\d+$/ ? id : nil
  end
end
