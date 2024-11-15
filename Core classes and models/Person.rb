class Person
  attr_reader :surname_initials, :git, :contact, :telephone, :telegram, :email

  def initialize(second_name:, first_name:, third_name:, git:, telephone: nil, telegram: nil, email: nil)
    @surname_initials = "#{second_name} #{first_name[0]}.#{third_name[0]}."
    self.git = git
    set_contacts(telephone: telephone, telegram: telegram, email: email)
  end

  def contact_choose
    if telephone
      "telephone: #{telephone}"
    elsif telegram
      "Telegram: #{telegram}"
    elsif email
      "Email: #{email}"
    else
      "Ни один из контактов не указан."
    end
  end

  def info 
    "ФИО: #{surname_initials}, Контакты: #{@contact}, Git: #{@git}"
  end

  def set_contacts(telephone: nil, telegram: nil, email: nil)
    self.telephone = telephone
    self.telegram = telegram
    self.email = email
    @contact = contact_choose(telephone, telegram, email)
  end

  private

  def self.telephone?(telephone)
    @telephone = telephone.to_s =~ /^\+\d{11}$/ ? telephone : nil
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

