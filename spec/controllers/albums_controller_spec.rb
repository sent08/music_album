require 'spec_helper'
include ActionDispatch::TestProcess

describe AlbumsController do
  def valid_attributes
    {
      "title"=>"FirstAlbum",
      "description"=>"This is my first album",
      "album" => fixture_file_upload('/sample.mp3', 'audio/mpeg')
    }
  end

  before(:each) do
    activate_authlogic
    UserSession.create Factory.build(:user)
  end

  describe "Get new" do
    it"should return new album"do
      get(:new)
      assigns[:album].should be_a_new(Album)
    end
  end

  describe "Get create" do
    it"should create new user"do
      expect {
        post :create, {:album => valid_attributes}
      }.to change(Album, :count).by(1)
    end

    it "Fail case must render" do
      Album.any_instance.stub(:save).and_return(false)
      post :create, {:album => {}}
      response.should render_template 'new'
    end
  end

end
