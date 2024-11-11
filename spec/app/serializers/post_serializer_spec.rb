require("rails_helper")

describe PostSerializer do
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
      include: '**'
    }

    serialization = ActiveModelSerializers::SerializableResource.new(post, options)

    puts serialization.to_json
  end
end