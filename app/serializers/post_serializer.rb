class PostSerializer < ApplicationSerializer
  # Questa che viene serializzata è la singola risorsa.


  # UserProfileSerializer, AuthorProfileSerializer -> per esempio possonoaverelo stesso type.
  # Può essere utile al client in fase di deseializzazione.
  # type 'profile'


  # https://github.com/rails-api/active_model_serializers/blob/v0.10.14/docs/general/configuration_options.md #serializer_lookup_chain
  # Se voglio posso anche definire qua un altro AuthorSerializer che avra priorità sull'::AuthorSerializer generico quando si serializzano i post.

  # Gli attributi possono essere anche condizionali.
  attributes(:id, :text)
  attribute(:title, key: :titolo)

  # association_type(association_name, options, &block)
  has_one(:author)
  # has_one(:author, { key: :autore })
  # has_one(:author, { serializer: AuthorSerializer })
  # has_one(:author, { if: -> { inclusion? } })
  # has_one(:author, { virtual_value: { id: 100, name: 'Pluto' } })

  # has_one(:author) do |serializer|
  #  raise serializer.class.inspect # PostSerializer
  #  # Evita di chiamare :author e chiama invece l'associazione che ritorna il blocco
  #  # Di default non mette gli include
  # end


  link :self do
    href "https://example.com/#{object.id}"
  end
  # Basta che sia definito il Rails.application.routes.default_url_options
  link(:post) { api_v1_posts_url }


  # Deve essere definito tra gli attributes.
  def text
    # L'object è il riferimento al modello che si vuole serializzare.
    "The text is #{object.text}"
  end

  def inclusion?
    false
  end

end