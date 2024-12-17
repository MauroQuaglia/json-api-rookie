class Caller::Authors < Caller::Base

  def initialize
    @sort_by = :rank
    @sort_direction = :desc
    super
  end

  def do_request
    api_response = request(build_query)
    if api_response.present?
      doc = JSON::Api::Vanilla.build(api_response)
      @total_count = doc.meta.dig(doc.data, 'count')
      @resource = doc.data.map do |json_author|
      end
    end
  end

  private

  def request(query)
    @response =  Rails.application.api_v1_authors_url(query)
  end
end