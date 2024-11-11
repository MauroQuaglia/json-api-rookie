require("rails_helper")

describe Author do
  it 'attr_reader' do
    author = Author.new(1, 'Mauro', 'Quaglia', 45)

    expect(author.id).to eq(1)
    expect(author.name).to eq('Mauro')
    expect(author.surname).to eq('Quaglia')
    expect(author.age).to eq(45)
  end
end