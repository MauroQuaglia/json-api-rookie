require("rails_helper")

describe 'Serializers' do

  # https://github.com/rails-api/active_model_serializers/blob/v0.10.14/docs/general/rendering.md
  it 'options' do
    # Creo la risorsa post.
    author = Author.new(1, 'Mauro', 'Quaglia', 45)
    post = Post.new(1, 'Title', 'Text', author)

    # Definisco le opzioni "da" serializer.
    # NB: Inutili perché se messe qui vengono ignorate poi dall'adapter.
    serializer_opts = {
      include: '**'
    }
    post_serializer = PostSerializer.new(post, serializer_opts)

    # Se le metto qui,, invece funzionano correttamente.
    # Anche le opzioni da serializer.
    adapter_opts = {
      adapter: :json_api,
      key_transform: :unaltered
    }
    post_adapter = ActiveModelSerializers::Adapter.create(post_serializer, adapter_opts)

    puts post_adapter.to_json
  end

end