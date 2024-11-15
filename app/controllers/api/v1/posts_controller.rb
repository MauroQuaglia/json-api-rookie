class Api::V1::PostsController < Api::ApiController

  def index
    author = Author.new(1, 'Mauro', 'Quaglia', 45)
    post1 = Post.new(1, 'Title 1', 'Text 1', author)
    post2 = Post.new(2, 'Title 2', 'Text 2', author)
    posts = [post1, post2]

    params_options = ::Adapters::JsonApi.new(params).options
    # Passaggio di uno scope al serializzatore (passo un METODO del controller)
    # E passaggio anche di un context al serializzatore (passo una VARIABILE del controller)
    options = { json: posts, adapter: :json_api, status: 200,
                scope: get_value, scope_name: :get_value_name, # Posso anche non mettere lo scope_name e nel serializzatore chiamare semplicemente "scope"
                context: { var_hello: "Hello World!" }
    }.merge(params_options)

    render(options)
  end

  private

  def get_value
    "y"
  end
end
