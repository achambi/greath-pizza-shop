FactoryBot.define do
  factory :option do
    category { ['cheese', 'sauce', 'crust'].sample }
    value { Faker::Food.dish }
  end

  factory :cheese_factory, class: Option do
    category { 'Cheese' }
    value { ['Mozzarella', 'Cheddar', 'Provolone'].sample }
  end

  factory :sauce_factory, class: Option do
    category { 'Sauce' }
    value { ['Spicy', 'Sweet', 'Heavy Basil', 'Peppery'].sample }
  end

  factory :crust_factory, class: Option do
    category { 'Crust' }
    value { ['Thin', 'Thick', 'Filled with cheese'].sample }
  end
end