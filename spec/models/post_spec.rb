require 'rails_helper'

RSpec.describe Post, type: :model do
  it { should have_many(:comments).dependent(:destroy) }
  # Validation tests
  # ensure columns title and created_by are present before saving
  # it { should validate_presence_of(:image) }
  it { should validate_presence_of(:content) }
end
