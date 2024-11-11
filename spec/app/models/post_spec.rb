require("rails_helper")

describe Post do
  it 'attr_reader' do
    post = Post.new(1, 'Title', 'Text', '#AUTHOR')

    expect(post.id).to eq(1)
    expect(post.title).to eq('Title')
    expect(post.text).to eq('Text')
    expect(post.author).to eq('#AUTHOR')
  end
end