class Person
  attr_reader :second_name, :first_name, :last_name, :id, :git

  def initialize(second_name:, first_name:, last_name: nil, id: nil, git: nil)
    self.second_name = second_name
    self.first_name = first_name
    self.last_name = last_name
    self.id = id
    self.git = git
  end

  def id=(id)
    @id = id.to_s =~ /^\d+$/ ? id : nil
  end

  def git=(git)
    @git = git.to_s =~ /^[a-zA-Z0-9_.+-]+$/ ? git : nil
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
end
