require 'spec_helper'
include ActionDispatch::TestProcess

describe Album do

  it { should belong_to(:user) }

  describe "#title" do
    it{should validate_presence_of(:title)}
  end

  before(:all) do
    @valid_user = create(:user,:first_name=>"validuser")
    @new_album = create(:album, :user => @valid_user)
  end

  it "create valid album" do
    count = Album.count
    @album = create(:album, :user => @valid_user)
    Album.all.should have(count.to_i + 1).items
  end

  it "will not create album without title" do
    @new_album.title = nil
    @new_album.should have(1).error_on(:title)
  end

  it "will not create album without album file" do
    @new_album.album = nil
    @new_album.should have(1).error_on(:album)
  end

  it "will not create album without user" do
    @new_album.user = nil
    @new_album.should have(1).error_on(:user)
  end

end
