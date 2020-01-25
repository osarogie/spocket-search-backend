module Types
  class FilterType < Types::BaseInputObject
    argument :min_price, Float, required: false
    argument :max_price, Float, required: false
    argument :country, [String], required: false
  end
end
