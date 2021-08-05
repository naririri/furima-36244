FactoryBot.define do
  factory :order_address do
    postal_number { '123-4567' }
    city          { '大阪市' }
    house_number  { 'a-1' }
    mobile_number { '09098765432' }
    building      { 'トキワ荘' }
    prefecture_id { 2 }
    token         {"tok_abcdefghijk00000000000000000"}
  end
end
