FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name { 'てすと' }
    first_name { 'てすと' }
    last_name_kana { 'テスト' }
    first_name_kana { 'テスト' }
    birthday { Date.new(1990, 1, 1) }
  end
end