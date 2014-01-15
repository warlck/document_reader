require 'spec_helper'


describe FoldersController do
	before(:each) do
	       @user = create(:user)
		   @request.cookies[:auth_token] = @user.auth_token
		   @folder = build(:folder)
		   @user.library.folders << @folder
	end

	describe "DELETE #destroy"  do
		it "deletes document" do
			expect{ delete :destroy, id: @folder}.
			to change(@user.library.folders, :count).by(-1)
		end

		it	'empties library' do
			delete :destroy, id: @folder
			expect(@user.library.folders).to be_empty
		end
	end

end