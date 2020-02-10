class Option < ApplicationRecord
  # model association
  has_many :cheese_orders, dependent: :destroy, class_name: 'Order', foreign_key: 'cheese_id'
  has_many :sauce_orders, dependent: :destroy, class_name: 'Order', foreign_key: 'sauce_id'
  has_many :crust_orders, dependent: :destroy, class_name: 'Order', foreign_key: 'crust_id'
  validates_presence_of :category, :value
end
