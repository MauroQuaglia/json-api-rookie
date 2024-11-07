ActiveModelSerializers si basa su due componenti:
serializers -> 
quali attributi e relazioni serializzare
#as_json, #to_json, #serializable_hash delegati poi all'adapter

adapters -> 
come serializzare attributi e relazioni
Dobbiamo usare il  JsonApi Adapter che è conforme alla specifica 1.0 delle JSON:API.



# Modello da serializzare
* app/models/author.rb
* __Deve__ esporre un attributo __id__ garantito come univoco.


author = Author.new('Mauro', 'Quaglia', 45)
serializer = AuthorSerializer.new(author)
adapter = ActiveModelSerializers::Adapter.create(serializer)
puts adapter.to_json

