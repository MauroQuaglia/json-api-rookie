class PostSerializer < ApplicationSerializer
  # https://github.com/rails-api/active_model_serializers/blob/v0.10.14/docs/general/configuration_options.md #serializer_lookup_chain
  # Se voglio posso anche definire qua un altro AuthorSerializer che avra priorità sull'::AuthorSerializer generico quando si serializzano i post.

  # Gli attributi possono essere anche condizionali.
  attributes(:id, :text)
  attribute(:title, key: :titolo)


  has_one(:author)

  # Deve essere definito tra gli attributes.
  def text
    # L'object è il riferimento al modello che si vuole serializzare.
    "The text is #{object.text}"
  end
end