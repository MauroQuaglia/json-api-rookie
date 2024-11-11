class Adapters::JsonApi
  def initialize(params)
    @params = params
  end

  def options
    {
      adapter: :json_api,
      key_transform: :unaltered,
      include: '**'
    }
  end
end