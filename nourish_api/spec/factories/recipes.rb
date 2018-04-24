FactoryBot.define do
  factory :recipe do
    title { Faker::Food.dish }
    user_id { Faker::Number.number(10) }
    source { Faker::Internet.url }
    servings { Faker::Number.digit }
    description { Faker::Food.describe }
  end
end