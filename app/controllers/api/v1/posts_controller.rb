class Api::V1::PostsController < Api::ApiController

  def index
    author = Author.new(1, 'Mauro', 'Quaglia', 45)
    post1 = Post.new(1, 'Title 1', 'Text 1', author)
    post2 = Post.new(2, 'Title 2', 'Text 2', author)
    posts = [post1, post2]

    params_options = ::Adapters::JsonApi.new(params).options
    options = { json: posts,
                adapter: :json_api,
                status: 200,
                #namespace: Api::V1::... # Non è il caso ma posso anche andarea dirgli dove cercare i serializzatori
                each_serializer: PostSerializerDoped, # Posso scegliere che serializzatore usare. Se ho una sola risorsa invecheche un array posso usare serializer: PostSerializerDoped.
                scope: get_value, scope_name: :get_value_name, # Posso anche non mettere lo scope_name e nel serializzatore chiamare semplicemente "scope". Sto praticamente passando un metodo del controller da chiamare nel serializzatore.
                context: { var_hello: "Hello World!" }, # Sto passando una variabile dal controller al serializzatore.
                links: my_links
    }.merge(params_options)

    render(options)
  end

  private

  def my_links
    { self: "http:/www.google.it" }
  end

  def get_value
    "y"
  end
end
