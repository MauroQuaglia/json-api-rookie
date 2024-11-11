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

# Giro più chiaro
author = Author.new(1, 'Mauro', 'Quaglia', 45)
author_serializer = AuthorSerializer.new(author)
adapter = ActiveModelSerializers::Adapter.create(author_serializer, adapter_options)
