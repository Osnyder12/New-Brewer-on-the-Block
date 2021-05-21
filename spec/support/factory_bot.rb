require 'factory_bot'

FactoryBot.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password { 'password' }
    password_confirmation { 'password' }
  end

  factory :beer do
    name { "Testing IPA" } 
    description { "Great tasting IPA for the summer months!" }
    abv { 6.4 }
    image_url {"https://cdn2.justwineapp.com/assets/article/2017/05/photo-pint-beer-free-stock-image-royalty-free-instagram-social-media.jpg"}
    ibu { 66 }
    ph { 5.0 }
    beer_volume_value { 18 }
    beer_volume_unit { "litres" }
    boil_volume_value { 25 }
    boil_volume_unit { "litres" }
    mash_temp_value { 45 }
    mash_temp_unit { "celsius" }
    mash_temp_duration { "65" }
    fermentation_value { 17 }
    fermentation_unit { "celsius" }
  end

  factory :review do 
    rating { 4 }
    difficulty { 7 }
    comment { "Had a great time making this. Tastes incredible!" }
  end
end
