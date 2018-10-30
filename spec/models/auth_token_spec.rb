require 'rails_helper'

RSpec.describe AuthToken, type: :model do
  context "associations" do
    it { should belong_to(:user) }
  end

  context "validations" do
    it { should validate_presence_of :token }
  end
end
