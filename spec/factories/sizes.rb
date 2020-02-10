FactoryBot.define do
  factory :size do
    name { ['Personal', 'Small', 'Medium', 'Large'].sample }
    slices { rand(1..8) }
  end
end