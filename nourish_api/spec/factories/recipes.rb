FactoryBot.define do
  factory :recipe do
    title { Faker::Food.dish }
<<<<<<< HEAD
    user_id { Faker::Number.number(10) }
    source { Faker::Internet.url }
    servings { Faker::Number.digit }
    description { Faker::Food.describe }
=======
    user_id { Faker::Number(1000) }
    source { Faker::Internet.url }
    servings { Faker::Number(10) }
    description { Faker::Food.description }
>>>>>>> 3cd8ffbe42a72039c7ab153407f88b1e2ab9fb99
  end
end