module Types
  class ProductType < Types::BaseObject
    field :title, String, null: false, description: "Title"
    field :description, String, null: false, description: "Description"
    field :price, String, null: false, description: "Price"
    field :country, String, null: false, description: "Country"
  end
end
