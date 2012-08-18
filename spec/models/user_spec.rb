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

  it "this will validate presence of display name or not" do
    @valid_user.display_name = " "
    @valid_user.should have(1).error_on(:display_name)
  end


  it "this will validate presence of user id or not" do
    @valid_user.first_name = nil
    @valid_user.should have(1).error_on(:first_name)
  end

  it "this will validate presence of email or not" do
    @valid_user.email = nil
    @valid_user.should have(3).error_on(:email)
  end

  it "this will validate email format" do
    @valid_user.email = "nil.com"
    @valid_user.should have(2).error_on(:email)
  end

#  #Validation Test case end

  it "returns album created by user" do
    @sam =create(:user)
    @sam.albums.should be_empty
  end

  it "returns album created by user" do
    @sam =create(:user)
    @album = create(:album, :user => @sam)
    @album.user_id.should eql @sam.id
    @sam.albums.should have(1).items
  end

  it "destory user should delete albums" do
    count = Album.count
    @sam =create(:user)
    create(:album, :user => @sam)
    @sam.destroy
    Album.all.should have(count.to_i).items
  end

end
