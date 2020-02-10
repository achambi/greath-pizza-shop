FactoryBot.define do
  factory :status do
    name { ['Preparing', 'Baking', 'Cutting', 'Boxing', 'delivering'].sample }
  end
end