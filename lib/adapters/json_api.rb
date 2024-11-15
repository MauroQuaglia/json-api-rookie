class Adapters::JsonApi
  def initialize(params)
    @params = params
  end

  def options
    {
      content_type: 'application/vnd.api+json',
      adapter: :json_api,
      key_transform: :unaltered,
      include: '**', # '' '*',
      fields: { author: ['age', 'name'] } # Sparse FieldSet. Posso scegliere quali campi mettere nell'include.
    }
  end
end