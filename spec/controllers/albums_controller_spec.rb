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
    create(:user)
    UserSession.create mock_model(User, :id => 1)
  end

  describe "Get new" do
    it"should return new album"do
      get(:new)
      assigns[:album].should be_a_new(Album)
    end
  end
end
