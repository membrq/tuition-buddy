require 'rails_helper'
#include Devise::Test::ControllerHelpers

RSpec.describe UsersController, :type => :controller do
  before :each do
    user = create(:user)
  #  sign_in user
    #login_user
  end
  #let(:user){create(:user)}

  #context for not signed in user?

  context "user is signed in" do
      #login_user

    #new method
    describe "GET #new" do
      it "returns http success" do
        expect(response).to have_http_status(:success)
      end

      it "instantiates a new user" do
        expect(:user).to_not be_nil
      end
    end

    #create method
    describe "POST #create" do
      #let(:user){create(:user)}

      it "returns an http redirect" do
        post :create
        expect(response).to have_http_status(:redirect)
      end

      it "sets user properly" do #or test each user attribute?
        post :create
        expect(assigns(:user)).to eq user
      end

      #redirect for user.save #same as http redirect
      #redirect for failed save
    end


    #show method
    describe 'GET #show' do

    #  it "renders the #show view" do
    #    get :show, params: {id: user.id}
    #    expect(response).to render_template(:show)
    #  end

      #it "finds the right user" do
      #  get :show#, {id: @user.id}
      #  expect(assigns(:user)).to eq(user)
      #end
    end

    #edit method
    describe 'GET #edit' do
  #    it "finds the right user" do
    #    get :edit, id: user.id
    #    expects(assigns(:user)).to eq user
  #    end
    end

    #update method
    describe 'PATCH #update' do
    #  before :each do
    #    get :update, id: user.id, user: attributes_for(:user, name: "Test")
    #  end

  #    it "finds the right user" do
      #  expects(assigns(:user)).to eq user
  #    end

  #    it "changes the right user attributes" do
      #  expect(user.name).to eq "Test"
  #    end

  #    it "redirects to show" do #only when update is successful
      #  expect(response).to redirect_to(user_path(user))
  #    end

  #    it "shows successful flash message" do #only when update is successful
      #  expect(flash[:notice]).to eq "Update was successful!"
  #    end
    end

    #destroy method
    describe 'DELETE #destroy' do

    end

    #context when user is admin--in view spec
  end
end
