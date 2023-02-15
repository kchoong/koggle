module Pagination
  extend ActiveSupport::Concern

  class Pager < Struct.new(:page, :pages, :per_page, :next_pages, :size, :order_by, :order_direction)
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

  def order_by
    params.fetch(:order_by, :id)
  end

  def order_direction
    params.fetch(:order_direction, :asc)
  end

  def paginate(records)
    size = records.all.count
    pages = (size + per_page - 1) / per_page
    next_pages = page_num.upto(page_num + 2).drop(1).select { |num| num < pages }
    @pager = Pager.new(page_num, pages, per_page, next_pages, size, order_by, order_direction)

    records.limit(per_page).offset(paginate_offset).order("#{order_by}": order_direction)
  end
end