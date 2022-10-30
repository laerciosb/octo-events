# frozen_string_literal: true

require 'pagy/backend'
require 'pagy/extras/headers'
require 'pagy/extras/items'
require 'pagy/extras/array'

module Pagination
  include Pagy::Backend

  Pagy::DEFAULT[:items_param] = :per # default :items
  # Pagy::DEFAULT[:items]       = 3  # default 20
  # Pagy::DEFAULT[:max_items]   = 5  # default 100
  # Pagy::DEFAULT[:page_param] = :page

  def paginate(collection)
    set_pagination_to(:pagy, collection)
  end

  private

  def set_pagination_to(method, collection)
    @pagy, @records = send(method, collection)

    pagy_headers_merge(@pagy)
    @records
  end
end
