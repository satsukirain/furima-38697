FactoryBot.define do
  factory :item do
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/IMG_0803.JPG'),filename: 'IMG_0803.JPG')
    end 

    product_name          {Faker::Name.name}
    explanation            {Faker::Lorem.sentence}
    category_id        {2}
    situation_id          {2}
    shipping_charge_id {2}
    region_of_origin_id {2}
    number_of_day_id   {2}
    price              {300}

  end
end