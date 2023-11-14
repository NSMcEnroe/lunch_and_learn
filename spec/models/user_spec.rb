require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :email }
    it { should have_secure_password }
  end

  it "should create an api key before creating a user" do
    user = User.new( name: "A", email: "B", password: "C", password_confirmation: "C")
    user.save
    expect(user.api_key).not_to be_nil
  end
end