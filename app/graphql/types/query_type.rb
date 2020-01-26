module Types
  class QueryType < Types::BaseObject
    field :all_products, ProductType.connection_type, null: false, description: "Search for products", connection: true do
      argument :query, String, default_value: '', required: false
      argument :filter, FilterType, default_value: {}, required: false
      argument :sort_by, String, default_value: 'relevance', required: false
    end

    field :all_countries, [String], null: false

    def all_products(query:, filter:, sort_by:)
      products = if query.present?
                   Product.search_for(query)
                 else
                   Product.all
                 end

      country_filter = filter[:country]&.filter { |c| !c.empty? }
      if country_filter&.any?
        products = products.where(country: country_filter)
      end

      if filter[:min_price].present? && filter[:min_price] == filter[:max_price]
        products = products.where("price = :price", price: filter[:min_price])
      else
        if filter[:min_price]
          products = products.where("price >= :min_price", min_price: filter[:min_price])
        end

        if filter[:max_price]
          products = products.where("price <= :max_price", max_price: filter[:max_price])
        end
      end

      case sort_by
      when "newest"
        products.order(id: :desc)
      when "lowest_price"
        products.order(price: :asc)
      when "highest_price"
        products.order(price: :desc)
      else
        products
      end
    end

    def all_countries
      Product.distinct(:country).pluck(:country)
    end
  end
end
