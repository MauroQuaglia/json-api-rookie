class Post < SerializablePoro
  attr_reader(:id, :title, :text)

  def initialize(id, title, text)
    @id = id
    @title = title
    @text = text
  end
end
