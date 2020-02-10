require 'rails_helper'

RSpec.describe Status, type: :model do
  # Association Status
  it { should have_many(:orders).dependent(:destroy) }

  # Validation Status Table
  it { should validate_presence_of(:name) }
end
