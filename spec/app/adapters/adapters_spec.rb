require("rails_helper")

describe 'Adapters' do
  # Possono essere solo di tre tipi a meno di non specificarne altri custom.
  let(:author) { Author.new(1, 'Mauro', 'Quaglia', 45) }
  let(:author_serializer) { AuthorSerializer.new(author) }

  it 'json_api' do
    adapter_options = { adapter: :json_api }
    adapter = ActiveModelSerializers::Adapter.create(author_serializer, adapter_options)

    puts adapter.to_json
  end

  it 'json' do
    adapter_options = { adapter: :json }
    adapter = ActiveModelSerializers::Adapter.create(author_serializer, adapter_options)

    puts adapter.to_json
  end

  it 'attributes' do
    adapter_options = { adapter: :attributes }
    adapter = ActiveModelSerializers::Adapter.create(author_serializer, adapter_options)

    puts adapter.to_json
  end
end