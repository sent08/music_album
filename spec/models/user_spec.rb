require 'spec_helper'
include ActionDispatch::TestProcess

describe User do
  it { should have_many(:albums) }

  describe "#display_name" do
    it{ create(:user)
      should validate_presence_of(:display_name)}
  end

  describe "#first_name" do
    it{should validate_presence_of(:first_name)}
  end


  describe "#last_name" do
    it{should validate_presence_of(:last_name)}
  end


  describe "#email" do
    it{should validate_presence_of(:email)}
    it{should validate_uniqueness_of(:email)}
  end


  before(:all) do
    @ram = create(:user,:first_name=>"ram")
    @joe = create(:user,:first_name=>"joe")
    @valid_user = create(:user,:first_name=>"validuser")
  end

end
