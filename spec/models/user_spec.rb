require 'rails_helper'

RSpec.describe User, type: :model do
  
  # Association test
  it { should have_many(:reviews)}
  
end