require 'rails_helper'

RSpec.describe Option, type: :model do
  it { should validate_presence_of(:category) }
  it { should validate_presence_of(:value) }
end