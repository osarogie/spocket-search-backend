FactoryBot.define do
  factory :product do
    title { "Walnut wood" }
    price { 23.09 }
    country { "United States" }

    trait :no_title do
      title { "" }
    end

    trait :no_country do
      country { "" }
    end

    trait :negative_price do
      price { -1 }
    end

    factory :product_with_negative_price, traits: [:negative_price]
  end
end
