require 'rails_helper'
 
 describe "Visiting profiles" do
 
   include TestFactories
 
   before do
     @user = authenticated_user
     @post = associated_post(user: @user)
     @comment = Comment.new(user: @user, post: @post, body: "A Comment")
    allow(@comment).to receive(:send_favorite_emails)
    @comment.save!
   end
 
   describe "not signed in" do
 
     it "shows profile" do
      visit user_path(@user)
      expect(current_path).to eq(user_path(@user))

      expect( page ).to have_content(@user.name)
      expect( page ).to have_content(@post.title)
      expect( page ).to have_content(@comment.body)
    end
 
   end

   describe "User visiting own profile" do

    include Warden::Test::Helpers
    Warden.test_mode!

    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)

    FactoryGirl.define do
      factory :user do
        email 'test@example.com'
        password 'f4k3p455w0rd'
      end
    end

    before do
      @user = authenticated_admin
      @post = associated_post(user: @user)
      @comment = Comment.new(user: @user, post: @post, body: "A Comment")
      allow(@comment).to receive(:send_favorite_emails)
      @comment.save!
   end
 end
end

