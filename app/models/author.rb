class Author < ActiveModelSerializers::Model
  attr_reader(:id, :name, :surname, :age)

  def initialize(name, surname, age)
    @id = SecureRandom.uuid
    @name = name
    @surname = surname
    @age = age
  end
end
