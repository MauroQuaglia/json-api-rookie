class SerializablePoro < ActiveModelSerializers::Model
  # https://github.com/rails-api/active_model_serializers/blob/v0.10.14/docs/howto/serialize_poro.md
  derive_attributes_from_names_and_fix_accessors
end