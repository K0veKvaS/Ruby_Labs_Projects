class Student
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
  end

  def info 
    "ID: #{@id || 'Не указано'}, ФИО: #{@first_name} #{@second_name} #{@third_name}, Телефон: #{@telephone}, Telegram: #{@telegram}, Email: #{@email}, Git: #{@git}"
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
