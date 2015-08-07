require 'rails_helper'
 
 describe User do
 
   include TestFactories
 
   describe "favorited(post)" do
     it "returns `nil` if the user has not favorited the post" do
     	expect( @favorite ).to eq(nil)
     end
 
     it "returns the appropriate favorite if it exists" do
     	expect ( @user.favorite) .to receive(:email)
     end
   end
 end