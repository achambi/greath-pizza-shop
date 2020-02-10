require 'rails_helper'

RSpec.describe Option, type: :model do
  it { should validate_presence_of(:category) }
  it { should validate_presence_of(:value) }

  # Associations
  it { should have_many(:cheese_orders).dependent(:destroy) }
  it { should have_many(:sauce_orders).dependent(:destroy) }
  it { should have_many(:crust_orders).dependent(:destroy) }
end
