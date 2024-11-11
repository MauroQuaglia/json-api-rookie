class PostSerializer < ActiveModel::Serializer
  attributes(:id, :title, :text)
  has_one(:author)
end