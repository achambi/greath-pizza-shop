class Option < ApplicationRecord
  validates_presence_of :id, :category, :value, :created_at, :updated_at
end
