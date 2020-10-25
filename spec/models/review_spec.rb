require 'rails_helper'

RSpec.describe Review, type: :model do
  
  # Association test
  it { should belong_to(:item)}
  it { should belong_to(:user)}
  
  # Validation tests
  it { should validate_presence_of(:is_interested) }
end
