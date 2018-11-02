require 'rails_helper'

RSpec.describe Article, type: :model do
  context "associations" do
    it { should belong_to(:user) }
  end

  context "validations" do
    it { should validate_presence_of :title }
    it { should validate_presence_of :body }
  end
end
