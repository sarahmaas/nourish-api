FactoryBot.define do
  factory :recipe do
    title { Faker::Food.dish }
    user_id { Faker::Number(1000) }
    source { Faker::Internet.url }
    servings { Faker::Number(10) }
    description { Faker::Food.description }
  end
end