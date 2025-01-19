require 'rails_helper'

RSpec.describe "Calculations", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /calculate" do
    it "returns http success" do
      post "/calculate"
      expect(response).to have_http_status(:success)
    end
  end

end
