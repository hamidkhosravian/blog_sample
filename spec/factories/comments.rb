FactoryBot.define do
  factory :comment, class: 'Comment' do
    body { Faker::Lorem.paragraph(3) }
    user { create(:user) }
    article { create(:article) }
  end
end
