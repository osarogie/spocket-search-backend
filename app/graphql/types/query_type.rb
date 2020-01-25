module Types
  class QueryType < Types::BaseObject
    field :all_products, ProductType.connection_type, null: false, description: "Search for products"

    def all_products
      Product.all
    end
  end
end
