FactoryBot.define do
  factory :order_address do
    postal_number { '123-4567' }
    city          { '大阪市' }
    house_number  { 'a-1' }
    mobile_number { '09098765432' }
    prefecture_id { 2 }
    order_id      { 99 }
  end
end
