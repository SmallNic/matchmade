require 'rails_helper'

RSpec.describe Review, type: :model do
  
  # Association test
  it { should belong_to(:item)}
  it { should belong_to(:user)}
  
  # Validation tests
  it { should validate_inclusion_of(:is_interested).in_array([true, false]) }
  it { should validate_uniqueness_of(:is_interested).scoped_to(:user_id, :item_id) }

end
