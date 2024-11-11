require("rails_helper")

describe AuthorSerializer do
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
      adapter: :json_api,
      serializer: AuthorSerializer,
      key_transform: :unaltered,
      fields: { author: [:name, :surname] } # Deve essere coerente con il key_transform.
    }

    serialization = ActiveModelSerializers::SerializableResource.new(author, options)

    puts serialization.to_json
  end
end