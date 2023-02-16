module Pagination
  extend ActiveSupport::Concern

  class Pager < Struct.new(:page, :pages, :per_page, :next_pages, :size, :sort_by, :sort_order)
  end

  def default_per_page
    25
  end

  def page_num
    params.fetch(:page, 1).to_i
  end

  def per_page
    params.fetch(:per_page, default_per_page).to_i
  end

  def paginate_offset
    (page_num - 1) * per_page
  end

  def sort_by(default)
    params.fetch(:sort_by, default).to_s
  end

  def sort_order(default)
    params.fetch(:sort_order, default).to_s
  end

  def paginate(records, default_sort_by=:id, default_sort_order=:asc)
    size = records.all.count
    pages = (size + per_page - 1) / per_page
    next_pages = page_num.upto(page_num + 2).drop(1).select { |num| num < pages }
    page_sort_by = sort_by(default_sort_by)
    page_sort_order = sort_order(default_sort_order)
    @pager = Pager.new(page_num, pages, per_page, next_pages, size, page_sort_by, page_sort_order)

    records.limit(per_page).offset(paginate_offset).order("#{page_sort_by}": page_sort_order)
  end
end