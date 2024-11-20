class Author < SerializablePoro
  attr_reader(:id, :name, :surname, :age, :birth)

  def initialize(id, name, surname, age, birth = Date.today)
    @id = id
    @name = name
    @surname = surname
    @age = age
    @birth = birth
  end
end