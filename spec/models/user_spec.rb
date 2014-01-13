require 'spec_helper'

describe User do

  describe "instance" do
      let(:user) { build_stubbed(:user)}
      subject { user }

      it { should respond_to(:email)}
      it { should respond_to(:password)}
      it { should respond_to(:password_digest)}
      it { should respond_to(:name) }
    end

    it "is invalid without email" do
       user = build_stubbed(:user, email: nil)
       expect(user).to be_invalid
    end

    it "has unique email" do
       create(:user, email: "foo@bar.com")
       user = build(:user, email: "foo@bar.com")
       expect(user).to have(1).errors_on(:email) 
    end

    it "is invalid without name" do
       user = build_stubbed(:user, name: nil)
       expect(user).to be_invalid
    end

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

  describe "library association" do
    let(:user) { create(:user)}
    it "provides library associated" do
       expect(user).to have_one(:library).dependent(:destroy)
    end

    it "succesfully used to create associated library upon user creation" do
       expect(user.library).not_to be_nil
    end
  end

  describe "documents association" do
     let(:user) { create(:user) }
     it "provides associated documents via library" do
        expect(user).to have_many(:documents).through(:library)
     end
  end

  describe "folders association" do
     let(:user) { create(:user)}
     it "provides associated folders via library" do
        expect(user).to have_many(:folders).through(:library)
     end
  end
end
