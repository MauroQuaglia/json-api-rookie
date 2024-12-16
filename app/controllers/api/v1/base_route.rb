class Api::V1::BaseRoute
  attr_reader(:page_number, :page_size, :fields, :filters, :includes)

  def initialize(params)
    @page_number = page_number_from(params)
    @page_size = page_size_from(params)
    @fields = fields_from(params)
    @filters = filters_from(params)
    @includes = includes_from(params)
    @sort = params[:sort]
  end

  def base_sortings(default_sort_by: :id, default_sort_direction: :asc)
    if @sort.present?
      @sort.split(',').map do |s|
        if s.start_with?('-')
          [s[1..-1].to_sym, :desc]
        else
          [s.to_sym, :asc]
        end
      end
    else
      [[default_sort_by, default_sort_direction]]
    end
  end

  def valid?
    valid_page?(@page_number) &&
      valid_page_size?(@page_size, accept_zero: true) &&
      valid_api_sort?
  end

  def serializer_class
    raise NotImplementedError
  end

  def available_sorting_params
    serializer_class._attributes.flat_map { |symbol| [symbol.to_s, "-#{symbol}"] }
  end

  private

  def page_number_from(params)
    (params.dig(:page, :number) || 1).to_i
  end

  def page_size_from(params)
    (params.dig(:page, :size) || 10).to_i
  end

  def fields_from(params)
    (params.dig(:fields) || {}).transform_values { |v| v.split(',') }.to_h
  end

  def filters_from(params)
    (params.dig(:filter) || {}).transform_values { |v| v.is_a?(String) ? v.split(',') : v }.to_h
  end

  def includes_from(params)
    (params[:include] || '').split(',')
  end

  def valid_api_sort?
    if @sort.present?
      sorts = @sort.split(',')
      sorts.to_set.subset?(available_sorting_params.to_set)
    else
      true
    end
  end

  def valid_page?(page_number = page)
    integer_greater_than_0_or_blank?(page_number)
  end

  def valid_page_size?(page_size, accept_zero: true)
    if accept_zero
      integer_greater_than_eq_0_or_blank?(page_size)
    else
      integer_greater_than_0_or_blank?(page_size)
    end
  end

  def integer_greater_than_0_or_blank?(number)
    (is_integer?(number) and Integer(number) > 0) or number.blank?
  end

  def integer_greater_than_eq_0_or_blank?(number)
    (is_integer?(number) and Integer(number) >= 0) or number.blank?
  end

  def is_integer?(string)
    true if Integer(string) rescue false
  end
end