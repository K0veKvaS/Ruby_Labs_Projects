class Person
  attr_reader :surname_initials, :git, :contact, :telephone, :telegram, :email

  def initialize(second_name:, first_name:, third_name:, git:, telephone: nil, telegram: nil, email: nil)
    @surname_initials = "#{second_name} #{first_name[0]}.#{third_name[0]}."
    self.git = git
    set_contacts(telephone: telephone, telegram: telegram, email: email)
  end

  def select_contact(telephone, telegram, email)
    contact_info = telephone || telegram || email || "Не указано"
    case contact_info
    when telephone
      "Telephone: #{telephone}"
    when telegram
      "Telegram: #{telegram}"
    when email
      "Email: #{email}"
    else
      "Не указано"
    end
  end

  def to_s
    output = []
    output << "#{@surname_initials}"
    output << "Git: #{@git}" 
    output << "Контакт: #{@contact}"
    output.join("; ")
  end

  def set_contacts(telephone: nil, telegram: nil, email: nil)
    self.telephone = telephone
    self.telegram = telegram
    self.email = email
    @contact = select_contact(telephone, telegram, email)
  end

  private

  def telephone=(telephone)
    if telephone =~ /^\+\d{11}$/
      @telephone = telephone
    else
      raise ArgumentError.new("Некорректный номер телефона")
    end
  end

  def telegram=(telegram)
    @telegram = telegram =~ /^@[a-zA-Z0-9_]{5,32}$/ ? telegram : nil
  end

  def email=(email)
    @email = email =~ /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]{2,})\z/ ? email : nil
  end

  def git=(git)
    @git = git =~ /^[a-zA-Z0-9_.+-]+$/ ? git : nil
  end
end

