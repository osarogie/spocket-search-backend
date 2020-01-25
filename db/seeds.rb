# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
products = JSON.parse(File.read(File.join(Rails.root, 'spec', 'helpers/SpocketProducts.json')))
products.each do |product|
  Product.create!(title: product["title"],
                  description: product["description"],
                  price: product["price"],
                  country: product["country"],
                  tag_list: product["tags"])
end
