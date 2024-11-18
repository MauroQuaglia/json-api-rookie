require("rails_helper")

describe 'json-api-vanilla' do
  context '#parse' do
    let(:articles) {
      File.read(Rails.root.join('spec', 'fixtures', 'articles.json'))
    }

    it 'should parse' do
      # Con il Debug torna comodo navigare e vedere cosa c'è dentro.
      docs = JSON::Api::Vanilla.parse(articles)

      article = docs.data[0]
      expect(article.title).to eq('JSON:API paints my bikeshed!')
      expect(article.author.first_name).to eq('Dan')
      expect(article.comments[1].body).to eq('I like XML better')

      comment_5 = docs.find('comments', '5')
      expect(comment_5.body).to eq('First!')

      comments = docs.find_all('comments')
      expect(comments.count).to eq(2)

      # I link delle risorse
      docs.links.each do |object, link|
        puts "Type: #{object} - link: #{link}"
      end
    end
  end
end