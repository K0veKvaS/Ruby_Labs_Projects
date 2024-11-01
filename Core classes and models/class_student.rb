class Student
  attr_accessor :id, :first_name, :second_name, :third_name, :telegram, :email, :git
  attr_reader :telephone

  def initialize(first_name:, second_name:, third_name:, id: nil, telephone: nil, telegram: nil, email: nil, git: nil)
    @first_name = first_name if self.class.valid_name?(first_name)
    @second_name = second_name if self.class.valid_name?(second_name)
    @third_name = third_name
    @id = id
    self.telephone = telephone if self.class.valid_telephone?(telephone)
    self.telegram = telegram if self.class.valid_telegram?(telegram)
    self.email = email if self.class.valid_email?(email)
    self.git = git if self.class.valid_git?(git)
  end

  def to_s
    "
    ID = #{@id || 'Пусто'}
    Surname = #{@second_name}
    Name = #{@first_name}
    Third_name = #{@third_name}
    Telephone = #{@telephone || 'Пусто'}
    Telegram = #{@telegram || 'Пусто'}
    Email = #{@email || 'Пусто'}
    Git = #{@git || 'Пусто'}
    "
  end 

  def self.valid_telephone?(telephone)
    telephone_regex = /^+d{11}$/
    return true if telephone.nil?
    telephone =~ telephone_regex
  end

  def self.valid_name?(name)
    name_regex = /^[A-Za-zА-Яа-яЁё'-]+$/
    return true if name.nil?
    name =~ name_regex
  end

  def self.valid_telegram?(telegram)
    telegram_regex = /^@[a-zA-Z0-9_]{5,32}$/
    return true if telegram.nil?
    telegram =~ telegram_regex
  end

  def self.valid_email?(email)
    email_regex = /A[^@s]+@([^@s]+.)+[^@s]+z/
    return true if email.nil?
    email =~ email_regex
  end

  def self.valid_git?(git)
    git_regex = /[a-zA-Z0-9_.+-]+$/
    return true if git.nil?
    git =~ git_regex
  end

  def telephone=(telephone)
    if self.class.valid_telephone?(telephone)
      @telephone = telephone
    else
      raise ArgumentError, "Некорректный номер телефона"
    end 
  end

  def first_name=(first_name)
    if self.class.valid_name?(first_name)
      @first_name = first_name
    else
      raise ArgumentError, "Некорректное имя"
    end 
  end

  def second_name=(second_name)
    if self.class.valid_name?(second_name)
      @second_name = second_name
    else
      raise ArgumentError, "Некорректная фамилия"
    end 
  end

  def telegram=(telegram)
    if self.class.valid_telegram?(telegram)
      @telegram = telegram
    else
      raise ArgumentError, "Некорректный Telegram"
    end 
  end

  def email=(email)
    if self.class.valid_email?(email)
      @email = email
    else
      raise ArgumentError, "Некорректный Email"
    end 
  end

  def git=(git)
    if self.class.valid_git?(git)
      @git = git
    else
      raise ArgumentError, "Некорректная ссылка на Git"
    end 
  end

  
  def validate
    validate_git_presence && validate_contact_presence
  end

  private

  def validate_git_presence
    !@git.nil?
  end

  def validate_contact_presence
    !@telephone.nil? || !@telegram.nil? || !@email.nil?
  end

  def info
    "ID: #{@id || 'Не указано'}, ФИО: #{@first_name} #{@second_name} #{@third_name}, Контактная информация: Телефон: #{@telephone || 'Не указано'}, Telegram: #{@telegram || 'Не указано'}, Email: #{@email || 'Не указано'}, Git: #{@git || 'Не указано'}"
  end
end
