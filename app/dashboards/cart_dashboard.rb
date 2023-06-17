require "administrate/base_dashboard"

class CartDashboard < Administrate::BaseDashboard
  # ...

  ATTRIBUTE_TYPES = {
    id: Field::Number,
    items: Field::HasMany,
    orders: Field::HasMany,
    user: Field::BelongsTo.with_options(
      searchable: true,
      searchable_field: 'email'
    ),
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  COLLECTION_ATTRIBUTES = %i[
    id
    user
    items
    orders
  ].freeze

  SHOW_PAGE_ATTRIBUTES = %i[
    id
    user
    items
    orders
    created_at
    updated_at
  ].freeze

  FORM_ATTRIBUTES = %i[
    user
    items
    orders
  ].freeze

  # COLLECTION_FILTERS
  # a hash that defines filters that can be used while searching via the search
  # field of the dashboard.
  #
  # For example to add an option to search for open resources by typing "open:"
  # in the search field:
  #
  #   COLLECTION_FILTERS = {
  #     open: ->(resources) { resources.where(open: true) }
  #   }.freeze
  COLLECTION_FILTERS = {}.freeze

  # Overwrite this method to customize how carts are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(cart)
  #   "Cart ##{cart.id}"
  # end
end
