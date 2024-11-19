source 'https://rubygems.org'

gem 'rails', '7.2.2'
gem 'rack', '3.0.11' # Altrimenti rspec_api_documentation si rompe.
gem 'gem-wrappers'
gem 'sprockets-rails'
gem 'pg'
gem 'puma'

# Per vedere la documentazione della API.
#gem 'apitome'

# Client
gem 'json-api-vanilla', '1.0.4' # Per il parsing della risposta

# Server
gem 'active_model_serializers', '0.10.14' # JSON:API 1.0

group(:development) do
  # Documentaione presa non da RubyGems ma direttamente da GitHub per alcuni fix legati a una issue.
  gem 'rspec_api_documentation', git: 'https://github.com/zipmark/rspec_api_documentation.git'
end


group(:test) do
  gem('rspec-rails')

  #jsonapi-rspec
  #jsonapi_rspec
  #rspec_jsonapi_serializer
end