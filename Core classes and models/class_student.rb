require_relative 'person'

class Student < Person
  attr_reader :telegram, :telephone, :email, :git

  def set_contacts(contacts = {})
    contacts.each do |key, value|
      instance_variable_set("@#{key}", value) if [:telephone, :telegram, :email, :git].include?(key.to_sym) && valid_field?(key, value)
    end
  end

  def info
    "ID: #{@id}\nФИО: #{@first_name} #{@second_name} #{@third_name}\nКонтактная информация:\n\tТелефон: #{@telephone}\n\tTelegram: #{@telegram}\n\tEmail: #{@email}\nГит:\n\tGit: #{@git}"
  end
  
  def getInfo
    "#{full_name_with_initials}; #{contact_info}; #{@git}"
  end

  def has_contact_info?
    !@telephone.nil? || !@telegram.nil? || !@email.nil?
  end
    
  def has_git?
    !@git.nil?
  end
    
  def validate?
    has_contact_info? && has_git?
  end

  def contact_info
    info = "Телефон: #{@telephone}" if !@telephone.nil?
    info = "Telegram: #{@telegram}" if !@telegram.nil?
    info = "Email: #{@email}" if !@email.nil?
  end

  def full_name_with_initials
    "#{@third_name} #{first_initial}.#{middle_initial}."
  end

  def valid_field?(field, value)
    super(field, value)
    case field
    when :telephone
      self.class.is_valid_number?(value)
    when :telegram
      self.class.is_valid_username?(value)
    when :email
      self.class.is_valid_email?(value)
    when :git
      self.class.is_valid_url?(value)
    else
      true
    end
  end
  
    private #=--------------------------------------------------------------------------
  
  def first_initial
    @first_name.chr
  end

  def middle_initial
    @second_name.chr
  end

  def self.is_valid_number?(value)
    /\+7\(\d{3}\)\d{3}-\d{2}-\d{2}/ === value
  end

  def self.is_valid_username?(value)
    /^[a-zA-Z0-9_]+$/ === value
  end

  def self.is_valid_email?(value)
    /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]{2,})\z/ === value
  end

  def self.is_valid_url?(value)
    /^(https?:\/\/)?((github|bitbucket)\.com)(:[^\/\s]+)?(\/[^\s]+)$/ === value
  end
end
