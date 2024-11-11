class Post < ActiveModelSerializers::Model
  attr_reader(:id, :title, :text, :comments, :author)

  def initialize(id, title, text, comments, author)
    @id = id
    @title = title
    @text = text
    @comments = comments
    @author = author
  end
end
