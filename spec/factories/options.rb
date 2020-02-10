FactoryBot.define do
  factory :option do
    category { ['cheese', 'sauce', 'crust'].sample }
    value { Faker::Food.dish }
  end
end