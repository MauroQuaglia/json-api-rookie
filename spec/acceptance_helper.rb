require 'rails_helper'
require 'rspec_api_documentation'
require 'rspec_api_documentation/dsl'

RspecApiDocumentation.configure do |config|
  config.format = [:html]
  config.curl_host = 'http://localhost:3000'
  config.api_name = "Example App API"
  config.api_explanation = "API Example Description"

  # [binary data] https://github.com/zipmark/rspec_api_documentation/issues/456
  # Vedere anche il Gemfile.
  config.response_body_formatter =
    Proc.new do |content_type, response_body|
      if content_type =~ /application\/.*json/
        JSON.pretty_generate(JSON.parse(response_body))
      else
        response_body
      end
    end
end