# frozen_string_literal: true

FactoryBot.define do
  factory :order do
    association :type, factory: :pizza_type
    association :size, factory: :size
    association :cheese, factory: :cheese_factory
    association :sauce, factory: :sauce_factory
    association :crust, factory: :crust_factory
  end
end