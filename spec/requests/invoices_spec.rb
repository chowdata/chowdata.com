require 'rails_helper'
require 'support/devise_support'
RSpec.describe "Invoices", type: :request do
  
  before :each do 
    sign_in_as_a_valid_user
  end

  describe "GET /invoices" do
    it "works! (now write some real specs)" do
      get invoices_path
      expect(response).to have_http_status(200)
    end
  end
end
