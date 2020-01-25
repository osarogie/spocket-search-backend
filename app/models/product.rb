class Product < ApplicationRecord
  include PgSearch

  pg_search_scope :search_for, against: %i(title description country)
  acts_as_taggable
end
