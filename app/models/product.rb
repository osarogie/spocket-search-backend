class Product < ApplicationRecord
  include PgSearch::Model

  validates :title,
            presence: true,
            length: {maximum: 50}

  validates :country,
            presence: true,
            format: {with: /[\w+\-.]/i}

  validates :price,
            presence: true,
            format: {with: /\A\d+(?:\.\d{1,2})?\z/},
            numericality: {greater_than: 0, less_than: 1000000}

  pg_search_scope(
      :search_for,
      against: {title: "B", description: "C", country: "D"},
      using: {
          tsearch: {
              tsvector_column: "tsv",
              dictionary: "english",
          }
      },
      associated_against: {
          tags: {name: "A"}
      }
  )
  acts_as_taggable
end
