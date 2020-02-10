class Size < ApplicationRecord
  # model association
  has_many :orders, dependent: :destroy

  # validations
  validates_presence_of :name, :slices
end
