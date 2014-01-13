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

  describe "#send_password_reset" do
  	let(:user) {create(:user) }
  	 it "is defined" do
  	   expect(user).to respond_to :send_password_reset
  	 end

  	 it "sets password reset token" do
  	 	user.send_password_reset
  	 	expect(user.password_reset_token).not_to be_nil
  	 end

  	 it "sets password reset sent at" do
  	 	user.send_password_reset
  	 	expect(user.password_reset_sent_at).to be_present
  	 end

  	 it "generates a unique password_reset_token each time" do
  	 	user.send_password_reset
  	 	last_token = user.password_reset_token
  	 	user.send_password_reset
  	 	expect(user.password_reset_token).not_to eq last_token
  	 end

  	 it "sends email to user" do
  	 	user.send_password_reset
  	 	expect(last_email.to).to include user.email
  	 end

  end
end
