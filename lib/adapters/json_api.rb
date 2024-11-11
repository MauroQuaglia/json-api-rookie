class Adapters::JsonApi
  def initialize(params)
    @params = params
  end

  def options
    {
      content_type: 'application/vnd.api+json',
      adapter: :json_api,
      key_transform: :unaltered,
      include: '**'
    }
  end
end