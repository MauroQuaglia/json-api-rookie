source 'https://rubygems.org'

gem 'rails'
gem 'gem-wrappers'
gem 'sprockets-rails'
gem 'pg'
gem 'puma'

# Client
gem 'httparty' # per le request
gem 'json-api-vanilla' # Per il parsing della risposta

# Server
gem 'active_model_serializers', '0.10.14' # JSON:API 1.0

# Per la URI
# application/x-www-form-urlencoded
# application/x-www-form-urlencoded serializer
# Usare URI.decode_www_form  (bizarre historical artifact that + characters must be treated as spaces)

group(:test) do
  gem('rspec-rails')
  #gem 'rspec-expectations'
end