class AuthorSerializer < ActiveModel::Serializer
  attributes(:surname, :age)
end