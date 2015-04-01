require 'rails_helper'
require 'support/devise_support'
RSpec.describe "Profiles", type: :request do
  
  before :each do 
    sign_in_as_a_valid_user
  end

  describe "GET /profiles/1/edit" do
    it "works! (now write some real specs)" do
      get edit_profile_path(Profile.create! FactoryGirl.attributes_for(:profile))
      expect(response).to have_http_status(200)
    end
  end
end
