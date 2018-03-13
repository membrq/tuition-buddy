require 'rails_helper'

RSpec.describe RequestsController, type: :controller do
  let(:my_user) {create(:user)}
  let(:my_request) {create(:request, user: my_user)}

  #index method
  describe "GET #index" do
    before :each do
      get :index, params: {id: my_request.id, user_id: my_user.id}
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
  end

  #new method
  describe "GET #new" do
    before :each do
      get :new, params: {id: my_request.id, user_id: my_user.id}
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "renders the #new view" do
      expect(response).to render_template(:new)
    end

    it "instantiates a new request" do
      expect(:request).to_not be_nil
    end
  end

  #create method
  describe "POST #create" do
    before :each do
      post :create, params: {id: my_request.id, user_id: my_user.id}
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

  end

  #show method
  describe "GET #show" do
    before :each do
      get :show, params: {id: my_request.id, user_id: my_user.id}
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "renders the #shows view" do
      expect(response).to render_template(:show)
    end

    it "retrieves the correct request" do
      expect(assigns(:request)).to eq(my_request)
    end
  end

  #edit method
  describe "GET #edit" do
    before :each do
      get :edit, params: {id: my_request.id, user_id: my_user.id}
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "renders the #edit view" do
      expect(response).to render_template(:edit)
    end
  end

  #update method
  describe "PUT #update" do
    before :each do
      put :update, params: {id: my_request.id, user_id: my_user.id}
    end

    it "updates request with expected attributes" do
        new_amount_requested = 200
        #new_body = RandomData.random_paragraph

        put :update, params: {id: my_request.id, user_id: my_user.id, request: {amount_requested: new_amount_requested}}
        debugger
        updated_request = assigns(:request)
        expect(updated_request.id).to eq(my_request.id)
        expect(updated_request.amount_requested).to eq(new_amount_requested)
        #expect(updated_post.body).to eq new_body
      end

    it "returns http redirect" do
      expect(response).to have_http_status(:redirect)
    end

    it "redirects to the correct path" do
      expect(response).to redirect_to([my_user, my_request])
    end
  end

  #destroy method
  describe 'DELETE #destroy' do
    before :each do
      delete :destroy, params: {id: my_request.id, user_id: my_user.id}
    end

    it "successfully deletes the request" do
      count = Request.where({id: my_request.id}).size
      expect(count).to eq(0)
    end

    it "returns http redirect" do
      expect(response).to have_http_status(:redirect)
    end

    it "redirects to the correct path" do
      expect(response).to redirect_to([my_user])
    end
  end
end
