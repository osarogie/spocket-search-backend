module Types
  class QueryType < Types::BaseObject
    field :all_products, ProductType.connection_type, null: false, description: "Search for products", connection: true do
      argument :query, String, default_value: '', required: false
      argument :filter, FilterType, default_value: {}, required: false
      argument :sort_by, String, default_value: 'relevance', required: false
    end

    field :all_countries, [String], null: false

    def all_products(**args)
      Products::SearchProducts.(**args)
    end

    def all_countries
      Product.distinct(:country).pluck(:country)
    end
  end
end
