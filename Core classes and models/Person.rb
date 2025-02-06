class Person
  attr_reader :id, :first_name, :second_name, :third_name

  def initialize(attributes = {id:, first_name:, second_name:, third_name:})
    attributes.each do |key, value|
      send("#{key}=", value) if respond_to?("#{key}=") && valid_field?(key, value)
    end
  end

  def id=(value)
    @id = value if valid_field?(id, value)
  end

  def first_name=(value)
    @first_name = value if valid_field?(first_name, value)
  end

  def second_name=(value)
    @second_name = value if valid_field?(second_name, value)
  end

  def third_name=(value)
    @third_name = value if valid_field?(third_name, value)
  end

    def self.is_valid_first_name?(value)
    /\A[A-ZА-я][a-zа-я]*\z/ === value
  end

  def self.is_valid_middle_name?(value)
    /\A[A-ZА-я][a-zа-я]*\z/ === value
  end

  def self.is_valid_last_name?(value)
    /\A[A-ZА-я][a-zа-я]*\z/ === value
  end

  def self.is_valid_id(value)
    value.is_a?(Integer)
  end

    def valid_field?(field, value)
    case field
    when :id
      self.class.is_valid_id(value)
    when :first_name
      self.class.is_valid_first_name?(value)
    when :second_name
      self.class.is_valid_middle_name?(value)
    when :third_name
      self.class.is_valid_last_name?(value)
    else
      true
    end
  end
end
