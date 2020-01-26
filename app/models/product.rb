class Product < ApplicationRecord
  include PgSearch::Model

  validates :title,
            presence: true,
            length: {maximum: 50}

  validates :country,
            presence: true,
            length: {maximum: 30},
            format: {with: /[\w+\-.]/i}

  validates :price,
            presence: true,
            format: {with: /\A\d+(?:\.\d{2})?\z/},
            numericality: {greater_than: 0, less_than: 1000000}

  pg_search_scope :search_for, against: %i(title description country)
  acts_as_taggable
end
