# Questo è quello che ho usato nei test
class PostSerializer < ApplicationSerializer
  attributes(:id, :my_id)
  attribute(:title, key: :titolo)

  has_one(:author)
  link :self do
    href "https://example.com/#{object.id}"
  end
  link(:post) { api_v1_posts_url }

  def my_id
    "The text is #{object.text}"
  end
end