require 'rails_helper'

RSpec.describe CalculationsController, type: :controller do
  describe "GET #new" do
    it "returns a successful response" do
      get :new
      expect(response).to be_successful
    end
  end

  describe "POST #calculate" do
    context "with a valid input string" do
      it "returns the correct sum" do
        post :calculate, params: { numbers: "1,2,3" }
        expect(assigns(:result)).to eq(6)
      end
    end

    context "with an empty string" do
      it "returns 0" do
        post :calculate, params: { numbers: "" }
        expect(assigns(:result)).to eq(0)
      end
    end

    context "with negative numbers" do
      it "raises an error" do
        post :calculate, params: { numbers: "1,-2,3" }
        expect(flash[:alert]).to eq("Negatives not allowed: -2")
      end
    end
  end
end
