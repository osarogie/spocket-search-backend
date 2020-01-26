FactoryBot.define do
  factory :product do
    sequence(:title) { Faker::Name.name }
    sequence(:description) { Faker::Name.name }
    sequence(:price) { Faker::Number.decimal(l_digits: 2, r_digits: 2) }
    sequence(:country) { Faker::Address.country }

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
