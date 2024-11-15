# Questo è quello che ho usato nel controller per fare tutte le prove.
class PostSerializerDoped < ApplicationSerializer
  # Questa che viene serializzata è la singola risorsa.

  # UserProfileSerializer, AuthorProfileSerializer -> per esempio possonoaverelo stesso type.
  # Può essere utile al client in fase di deseializzazione.
  # type 'profile'

  # https://github.com/rails-api/active_model_serializers/blob/v0.10.14/docs/general/configuration_options.md #serializer_lookup_chain
  # Se voglio posso anche definire qua un altro AuthorSerializer che avra priorità sull'::AuthorSerializer generico quando si serializzano i post.

  # Gli attributi possono essere anche condizionali.
  attributes(:id, :my_id)
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

  # I link in questo caso sono relativi alla singola risorsa che sta serializzando
  link :self do
    href "https://example.com/#{object.id}"
  end
  # Basta che sia definito il Rails.application.routes.default_url_options
  link(:post) { api_v1_posts_url }

  # Deve essere definito tra gli attributes.
  def my_id
    # L'object è il riferimento al modello che si vuole serializzare.
    "The text is #{object.text}"
  end

  def inclusion?
    false
  end

  # SCOPE e CONTEXT
  attributes(:text, :test_scope)

  def test_scope
    # Lo scope è quello passato dal controller. scope === get_value_name
    result = ''
    if scope == 'x' # scope === get_value_name
      result += "Scope X - "
    else
      result += "Scope NOT X - "
    end

    if instance_options[:context].present?
      result += "instance_options = #{instance_options[:context][:var_hello]}"
    end

    # Per provare un po' di cose
    result += "#{json_key} - read_attribute_for_serialization: #{my_id.to_s}"
    result
  end

  meta do
    {
      stuff: 'Homer Simpson',
      id: object.id
    }
  end

end