require 'rails_helper'

RSpec.describe User, type: :model do
  context "associations" do
    it { should have_many(:auth_tokens) }
  end

  context "validations" do
    it { should validate_presence_of :email }
    it { should validate_presence_of :encrypted_password }
  end
end
