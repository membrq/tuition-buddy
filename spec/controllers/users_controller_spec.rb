require 'rails_helper'
#include Devise::Test::ControllerHelpers

RSpec.describe UsersController, :type => :controller do
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
    before :each do
      post :create, params:{ user: {name: "Bob", email: "bob@email.com", password: "blah", password_confirmation: "blah"}}
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "logs the user in after sign up" do
      expect(session[:user_id]).to eq assigns(:user).id
    end
  end

  #show method
  describe 'GET #show' do
    let(:factory_user) {create(:user)}

    before :each do
      sign_in factory_user
      get :show, params: {id: factory_user.id}
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
      expect(response).to render_template(:show)
    end

    it "finds the right user" do
      expect(assigns(:user)).to eq(factory_user)
    end
  end

  #edit method
  describe 'GET #edit' do
    let(:factory_user) {create(:user)}

    before :each do
      sign_in factory_user
      get :edit, params: {id: factory_user.id}
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "finds the right user" do
      expect(assigns(:user)).to eq(factory_user)
    end

    it "renders the #edit view" do
      expect(response).to render_template(:edit)
    end
  end

  #update method
  describe 'PUT #update' do
    let(:factory_user) {create(:user)}

    before :each do
      sign_in factory_user
      put :update, params: {id: factory_user.id}#, factory_user: attributes_for(:factory_user, name: "Test")}
    end

    #it "finds the right user" do
    #  expects(assigns(:user)).to eq(factory_user)
    #end

    it "updates user with expected attributes" do
        new_name = "Bob"
        #new_body = RandomData.random_paragraph

        put :update, params: {id: factory_user.id, user: {name: new_name}}

        updated_user = assigns(:user)
        expect(updated_user.id).to eq(factory_user.id)
        expect(updated_user.name).to eq(new_name)
        #expect(updated_user.body).to eq new_body
      end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "redirects to the correct path" do
      expect(response).to redirect_to([factory_user])
    end

#    it "changes the right user attributes" do
    #  expect(user.name).to eq("Test")
#    end


  end
end
