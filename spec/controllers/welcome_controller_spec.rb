require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do

  describe "GET #index" do
    it "renders the index template" do
      get :index
      expect(response).to render_template ("index")
    end

    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #about" do
    it "renders the about template" do
      get :about
      expect(response).to render_template ("about")
    end

    it "returns http success" do
      get :about
      expect(response).to have_http_status(:success)
    end
  end

end
