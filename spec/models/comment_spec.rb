require 'rails_helper'

RSpec.describe Comment, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  it { should belong_to(:post) } 
  
  # Validation tests
  # ensure columns title and created_by are present before saving
  it { should validate_presence_of(:content) }
  
end
