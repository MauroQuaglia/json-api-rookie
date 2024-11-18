class Author < SerializablePoro
  attr_reader(:id, :name, :surname, :age)

  def initialize(id, name, surname, age)
    @id = id
    @name = name
    @surname = surname
    @age = age
  end
end