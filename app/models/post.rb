class Post < ActiveModelSerializers::Model
  attr_reader(:id, :title, :text)

  def initialize(id, title, text, author)
    @id = id
    @title = title
    @text = text
    @author = author
  end

  def author
    @author
  end
end
