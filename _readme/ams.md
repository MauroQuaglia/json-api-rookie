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
```
author = Author.new(1, 'Mauro', 'Quaglia', 45)

# Le opzioni del serializer riguardano cosa viene serializzato.
# Fields, include, filter, ...
author_serializer = AuthorSerializer.new(author, serializer_options)

# Le opzioni dell'adapter riguardano il come le cose serializzate devono essere strutturate.
# case, key-transform, ...
adapter = ActiveModelSerializers::Adapter.create(author_serializer, adapter_options)

# NB: Alcune opzioni si possono sovrapporre.
# Però sono a due livelli distinti.
```