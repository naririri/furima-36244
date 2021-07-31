FactoryBot.define do
  factory :user do
    #nick_name { 'tech' }
    #email { 'test@example' }
    #password { 'test1234' }
    nick_name             {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation { password }
    last_name { '手口' }
    first_name { '脚譜男' }
    reading_last_name { 'テク' }
    reading_first_name { 'キャプオ' }
    birthday { '1975-01-01' }
  end
end
