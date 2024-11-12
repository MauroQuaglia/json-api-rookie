require("rails_helper")

describe AuthorSerializer do
  # In questo modo ignora qualsiasi option, serve qualcosa in più per fargliele digerire come il SerializableResource.
  context 'Row (AuthorSerializer)' do
    it 'to_json' do
      author = Author.new(1, 'Mauro', 'Quaglia', 45)
      author_serializer = AuthorSerializer.new(author, {})

      # Però mi da una rappresentazione json.
      puts author_serializer.to_json
    end
  end

  # In questo considera le option.
  # Dato che si parla di Serializer e non di Adapter, le opzioni sono quelle di serializzazione: include, field, ...
  # Anche se in realtà il SerializableResource agisce come un "controller" per cui capisce tutto.
  context 'Like in a controller (ActiveModelSerializers::SerializableResource)' do

    it 'attributes' do
      author = Author.new(1, 'Mauro', 'Quaglia', 45)
      options = {}

      # Passando la risora Author viene utilizzato per convenzione l'AuthorSerializer.
      serialization = ActiveModelSerializers::SerializableResource.new(author, options)

      puts serialization.to_json
    end

    it 'custom options' do
      author = Author.new(1, 'Mauro', 'Quaglia', 45)
      options = {
        serializer: AuthorSerializer,  # Opzione da Serializer
        key_transform: :unaltered,  # Opzione da Adapter
        fields: { author: [:name, :surname] } # Deve essere coerente con il key_transform.
      }

      serialization = ActiveModelSerializers::SerializableResource.new(author, options)

      puts serialization.to_json
    end
  end
end