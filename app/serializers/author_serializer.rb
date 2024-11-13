class AuthorSerializer < ApplicationSerializer
  attributes(:id, :name, :surname, :age)

  link :self do
    href "https://pippo.com/#{object.id}"
  end
end