class Option < ApplicationRecord
  validates_presence_of :category, :value
end
