# Mi serve nei serializer se voglio fare cose del tipo: api_v1_posts_url
Rails.application.routes.default_url_options = {
  host: 'example.com'
}