# Adapter e Serializer
* __ActiveModelSerializers__ si basa su due componenti:
  * `serializer` -> quali attributi e relazioni serializzare
  * `adapter` -> come serializzare attributi e relazioni

# Osservazione sulle opzioni
* Le opzioni passate al serializer vengono ignorate
* Le opzioni passate all'adapter vengono recepite.
* Le opzioni si possono suddividere "mentalmente" in due categorie:
  * serializer_opts: quali attributi e relazioni serializzare
  * adapter_opts: come serializzare attributi e relazioni, ed anche quali attributi e relazioni serializzare

# Tre modi di serializzare
## A mano
```
author = Author.new(1, 'Mauro', 'Quaglia', 45)
post = Post.new(1, 'Title', 'Text', author)

post_serializer = PostSerializer.new(post, {}) # Non passo opzioni perché le ignora.

adapter_opts = { adapter: :json_api, key_transform: :unaltered } # Qui posso mettere "cosa" e "come" serializzare.
post_adapter = ActiveModelSerializers::Adapter.create(post_serializer, adapter_opts)

post_adapter.to_json # risultato
```

## Automatismo del controller di Rails
* Qui è dove AMS fa la magia, nel `render({ json: ...})` del controller 
```
author = Author.new(1, 'Mauro', 'Quaglia', 45)
post = Post.new(1, 'Title', 'Text', author)

render({ json: post, adapter: :json_api, key_transform: :unaltered, status: 200 })
```

## Agire esattamente come fa il controller ma al di fuori del contesto del controller
```
author = Author.new(1, 'Mauro', 'Quaglia', 45)
post = Post.new(1, 'Title', 'Text', author)

serialization = ActiveModelSerializers::SerializableResource.new(post, { adapter: :json_api, key_transform: :unaltered })
serialization.to_json # Stesso risultato del controller
```