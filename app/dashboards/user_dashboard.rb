require "administrate/base_dashboard"

class UserDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    cart: Field::HasOne,
    city: Field::String,
    email: Field::String,
    encrypted_password: Field::String,
    first_name: Field::String,
    is_admin: Field::Boolean,
    last_name: Field::String,
    remember_created_at: Field::DateTime,
    reset_password_sent_at: Field::DateTime,
    reset_password_token: Field::String,
    street: Field::String,
    zip_code: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  COLLECTION_ATTRIBUTES = %i[
    id
    first_name
    last_name
    street
    city
    zip_code
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  SHOW_PAGE_ATTRIBUTES = %i[
    id
    first_name
    last_name
    street
    city
    zip_code
    email
    encrypted_password
    is_admin
    remember_created_at
    reset_password_sent_at
    reset_password_token
    cart
    created_at
    updated_at
  ].freeze

  # FORM_ATTRIBUTES
  FORM_ATTRIBUTES = %i[
    first_name
    last_name
    street
    city
    zip_code
    email
    encrypted_password
    is_admin
    remember_created_at
    reset_password_sent_at
    reset_password_token
    cart
  ].freeze

  # COLLECTION_FILTERS
  COLLECTION_FILTERS = {}.freeze

  # Overwrite this method to customize how users are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(user)
  #   "User ##{user.id}"
  # end
end