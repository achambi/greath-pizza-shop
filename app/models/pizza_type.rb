class PizzaType < ApplicationRecord
  # model association
  has_many :orders, dependent: :destroy, class_name: 'Order', foreign_key: 'type_id'

  # validations
  validates_presence_of :name
end
