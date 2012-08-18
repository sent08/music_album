require 'spec_helper'

describe UsersController do
  def valid_attributes
    {
      "display_name"=>"annabond",
      "first_name"=>"anna",
      "last_name"=>"bond",
      "email"=>"anna@in.com",
      "password"=>"password",
      "password_confirmation"=>"password"
    }
  end

  describe "Get new" do
    it"should return new user"do
      get(:new)
      assigns[:user].should be_a_new(User)
    end
  end

  describe "Get create" do
    it"should create new user"do

      expect {
        post :create, {:user => valid_attributes}
      }.to change(User, :count).by(1)
    end

    it "check the flash and redirect after create" do
      User.any_instance.stub(:save).and_return(true)
      post :create, {:user=>valid_attributes}
      flash[:notice].should include("Account created successfully")
      response.should redirect_to home_path
    end

    it "Fail case must render" do
      User.any_instance.stub(:save).and_return(false)
      post :create, {:user => {}}
      response.should render_template 'new'
    end
  end

end
