class TpApi::Coupons::Base
  def initialize
    @page =  1
    @page_size = 10
    @filter = {}
    @includes = []
  end

  def sort_by(sort_by)
    @sort_by = sort_by
    self
  end

  def sort_direction(sort_direction)
    @sort_direction = sort_direction
    self
  end

  def page(page)
    @page = page
    self
  end

  def page_size(page_size)
    @page_size = page_size
    self
  end

  def includes(values)
    if @includes
      @includes += Array(values)
    else
      @includes = (Array(values) || [])
    end
    self
  end

  def filter(conditions)
    @filter = conditions
    self
  end

  def include_resource?(resource)
    @includes.include?('*') or @includes.include?(resource)
  end

  def total_count
    do_request unless defined? @response
    @total_count
  end

  def all
    do_request unless defined? @response
    @resource
  end

  def first
    all.first
  end

  private

  def build_query
    sort = @sort_direction == :asc ? @sort_by : "-#{@sort_by}"
    result = { page: { size: @page_size, number: @page },
               sort: sort,
               include: (@includes || []).join(',') }.reject { |_, v| v.blank? }
    result[:filter] = @filter.transform_values { |v| v.is_a?(Array) ? v.join(',') : v } if @filter.any?
    result
  end
end


