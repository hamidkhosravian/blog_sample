FactoryBot.define do
  factory :user, class: 'User' do
    email { Faker::Internet.email }
    password { "123456aA" }
    role { 'regular' }
    factory :valid_user_register do
       confirm_password { "123456aA" }
    end
  end
end
