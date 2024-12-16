class Api::V1::AuthorsRoute < Api::V1::BaseRoute
  def serializer_class
    AuthorSerializer
  end

  def sortings
    base_sortings(default_sort_by: :rank, default_sort_direction: :desc)
  end
end