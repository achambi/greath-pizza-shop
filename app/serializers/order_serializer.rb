class OrderSerializer < ActiveModel::Serializer
  attributes :id
  attribute :type do
    object.type.name
  end
  attribute :size do
    object.size.name
  end
  attribute :cheese do
    object.cheese.value
  end
  attribute :sauce do
    object.sauce.value
  end
  attribute :crust do
    object.crust.value
  end
end
