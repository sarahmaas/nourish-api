FactoryBot.define do
  factory :recipe do
    title { Faker::Food.dish }
    user_id nil
    source { Faker::Internet.url }
    servings { Faker::Number.digit }
    description { Faker::Food.describe }
  end
end