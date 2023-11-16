FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.email }
    password              { "1a#{Faker::Internet.password(min_length: 4)}" }
    password_confirmation { password }
    last_name { 'やマ田' }
    first_name { '太ろウ' }
    last_name_kana { 'ヤマダ' }
    first_name_kana { 'タロウ' }
    birthday { Date.new(1990, 1, 1) }
  end
end
