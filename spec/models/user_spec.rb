require 'spec_helper'

describe User do
  


  describe "authentication token" do
  	 let(:user) { create(:user)}
  	it "has #auth_token field" do
  	   expect(user).to respond_to :auth_token	
  	end

  	it "is created upon user creation" do
  		expect(user.auth_token).not_to be_nil
  	end
  	
  end
end
