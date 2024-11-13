# https://github.com/rails-api/active_model_serializers/blob/v0.10.14/docs/general/configuration_options.md

# Generali
ActiveModelSerializers.config.adapter = :json_api
ActiveModelSerializers.config.key_transform = :unaltered
ActiveModelSerializers.config.default_includes = '**'

# JSON:API
ActiveModelSerializers.config.jsonapi_resource_type = :singular
ActiveModelSerializers.config.jsonapi_namespace_separator = '--'
ActiveModelSerializers.config.jsonapi_include_toplevel_object = true # Così è più chiato che uso la JSON:API v1.0

Rails.application.routes.default_url_options = {
  host: 'example.com'
}
