module Types
  class ProductType < Types::BaseObject
    implements GraphQL::Relay::Node.interface

    field :id, ID, null: false, description: "id"
    field :title, String, null: false, description: "Title"
    field :description, String, null: false, description: "Description"
    field :price, Float, null: false, description: "Price"
    field :country, String, null: false, description: "Country"
    field :tags, String, null: false, description: "Tags", method: :tag_list
    field :created_at, String, null: false, description: "Created At"

    def price
      sprintf('%.2f', object.price)
    end
  end
end
