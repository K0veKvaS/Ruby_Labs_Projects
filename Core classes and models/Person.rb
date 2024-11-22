class Person
  attr_accessor :second_name, :first_name, :last_name

  def initialize(second_name:, first_name:, last_name: nil)
    self.second_name = second_name
    self.first_name = first_name
    self.last_name = last_name
  end

  def first_name=(first_name)
    @first_name = first_name.to_s =~ /^[A-Za-zА-Яа-яЁё'-]+$/ ? first_name : nil
  end

  def second_name=(second_name)
    @second_name = second_name.to_s =~ /^[A-Za-zА-Яа-яЁё'-]+$/ ? second_name : nil
  end

  def last_name=(last_name)
    @last_name = last_name.to_s =~ /^[A-Za-zА-Яа-яЁё'-]+$/ ? last_name : nil
  end

  def initials
    "#{@second_name} #{initials_string}"
  end

  private
  def initials_string
    "#{@first_name[0]}.#{@last_name ? " #{@last_name[0]}" : ''}."
  end

  protected
  def contact_method
    return "Телефон: #{@telephone}" if @telephone
    return "Telegram: #{@telegram}" if @telegram
    return "Email: #{@email}" if @email
    "Контактная информация недоступна"
  end
end
