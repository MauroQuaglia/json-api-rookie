class Api::V1::AuthorsController < Api::ApiController

  # ESMEPIO:
  # http://localhost:3000/api/v1/authors?page[number]=1&page[size]=5&fields[name]=Mauro&filter[age][gt]=45&sort=-name&include=posts
  def index
    @route = Api::V1::AuthorsRoute.new(posts_params)
    return head :bad_request unless @route.valid?

    # Qui poi mi servirà il filtraggio dei dati in base ai parametri della rotta AuthorsRoute.
    # Sarebbe interessante implementari operatori di questo tipo per recuperari i dati da 'database':
    # lt
    # le
    # eq
    # ge
    # gt
    # in
    # like
    # ne
    # La AuthorsRoute già li "comprende" ma poi serve interpretarli e andarli a pescare alla sorgente.

    author1 = Author.new(1, 'Mauro', 'Quaglia', 45)
    author2 = Author.new(2, 'Max', 'Quaglia', 40)
    author3 = Author.new(3, 'David', 'Quaglia', 35)
    authors = [author1, author2, author3]
    total_count = authors.count

    render(json: authors,
           adapter: :json_api,
           meta: { count: total_count },
           fields: @route.fields,
           include: @route.includes,
           included: @route.includes.join(','),
           status: total_count.zero? ? :not_found : :ok)
  end

  private

  def posts_params
    params.permit(:sort, :include, fields: {}, filter: {}, page: [:number, :size])
  end
end
