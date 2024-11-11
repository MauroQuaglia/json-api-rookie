class AuthorSerializer < ActiveModel::Serializer
  attributes(:id, :name, :surname, :age)
end