class Order < ApplicationRecord
  # model association
  belongs_to :size
  belongs_to :type, class_name: 'PizzaType', foreign_key: :type_id
  belongs_to :cheese, class_name: 'Option', foreign_key: :cheese_id
  belongs_to :sauce, class_name: 'Option', foreign_key: :sauce_id
  belongs_to :crust, class_name: 'Option', foreign_key: :crust_id
  belongs_to :status
end
