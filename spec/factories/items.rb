FactoryBot.define do
  factory :item do
    name          {Faker::Name.initials(number: 5)}
    info          {Faker::Lorem.sentence}
    category_id   {'2'}
    condition_id  {'2'}
    postage_id    {'2'}
    prefecture_id {'2'}
    post_date_id  {'2'}
    price         {'400'}
    #image         {Faker::Lorem.sentence}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_logo.png'), filename: 'logo.jpg')
    end
  end
end
