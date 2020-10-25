require 'rails_helper'

RSpec.describe Item, type: :model do
  
  # Association test
  it { should have_many(:reviews)}
  
  # Validation tests
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:category) }

end
