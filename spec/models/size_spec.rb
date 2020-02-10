require 'rails_helper'

RSpec.describe Size, type: :model do
  # Association Order
  # ensure Order model has a 1:m relationship with the Size model
  it { should have_many(:orders).dependent(:destroy) }

  # Validation Size Table
  # ensure columns name, slides is present before saving
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:slices) }
end
