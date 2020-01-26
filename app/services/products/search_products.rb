module Products
  class SearchProducts
    def self.call(query: '', filter: {}, sort_by: "relevance")
      if query.present?
        products = if sort_by == "relevance"
                     Product.search_for(query)
                   else
                     Product.all
                   end

        products = apply_filter(products, **filter)
        products = sort(products, sort_by)

        if sort_by == "relevance"
          products
        else
          products.search_for(query)
        end
      else
        products = Product.all
        products = apply_filter(products, **filter)
        sort(products, sort_by)
      end
    end

    private

    def self.apply_filter(filterable_products, country: nil, max_price: nil, min_price: nil)
      products = filterable_products

      country_filter = country&.filter_map { |c| c.downcase unless c.empty? }
      if country_filter&.any?
        products = products.where("lower(country) IN (:country)", country: country_filter)
      end

      if min_price && min_price == max_price
        products = products.where("price = :price", price: min_price)
      else
        if min_price
          products = products.where("price >= :min_price", min_price: min_price)
        end

        if max_price
          products = products.where("price <= :max_price", max_price: max_price)
        end
      end

      products
    end

    def self.sort(products, sort_by)
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
  end
end
