class Api::V1::PostsController < Api::ApiController

  def index
    author = Author.new(1, 'Mauro', 'Quaglia', 45)
    post1 = Post.new(1, 'Title 1', 'Text 1', author)
    post2 = Post.new(2, 'Title 2', 'Text 2', author)
    posts = [post1, post2]

    # TODO content-type
    params_options = ::Adapters::JsonApi.new(params).options
    options = { json: posts, adapter: :json_api, status: 200}.merge(params_options)

    render(options)
  end
end
