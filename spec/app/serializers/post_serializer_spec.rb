require("rails_helper")

describe PostSerializer do
  # Torna solo json: https://github.com/rails-api/active_model_serializers/blob/v0.10.14/docs/general/adapters.md#adapters
  context 'Row (AuthorSerializer)' do
    it 'to_json' do
      author = Author.new(1, 'Mauro', 'Quaglia', 45)
      post = Post.new(1, 'Title', 'Text', author)

      post_serializer = PostSerializer.new(post, {})

      puts post_serializer.to_json
    end
  end

  context 'Like in a controller (ActiveModelSerializers::SerializableResource)' do

    it 'attributes' do
      author = Author.new(1, 'Mauro', 'Quaglia', 45)
      post = Post.new(1, 'Title', 'Text', author)

      serialization = ActiveModelSerializers::SerializableResource.new(post, {})

      puts serialization.to_json
    end

    it 'include all' do
      author = Author.new(1, 'Mauro', 'Quaglia', 45)
      post = Post.new(1, 'Title', 'Text', author)
      options = {
        include: '**', # opzione da serializer
        key_transform: :camel # opzione da adapter
      }

      serialization = ActiveModelSerializers::SerializableResource.new(post, options)

      puts serialization.to_json
    end
  end
end