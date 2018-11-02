FactoryBot.define do
  factory :article, class: 'Article' do
    title { Faker::Lorem.sentence }
    body { Faker::Lorem.paragraph(3) }
    user { create(:user) }
  end
end
