require 'rails_helper'

RSpec.describe Order, type: :model do
  # Association test
  # ensure an order record belongs to a single size record
  it { should belong_to(:size) }

  # ensure an order record belongs to a single type record
  it { should belong_to(:type) }

  # ensure an order record belongs to a single cheese record
  it { should belong_to(:cheese) }

  # ensure an order record belongs to a single sauce record
  it { should belong_to(:sauce) }

  # ensure an order record belongs to a single crust record
  it { should belong_to(:crust) }
end
