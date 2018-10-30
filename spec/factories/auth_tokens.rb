FactoryBot.define do
  factory :auth_token, class: 'AuthToken' do
    token { "MyString" }
    refresh_token { "" }
    user { nil }
  end
end
