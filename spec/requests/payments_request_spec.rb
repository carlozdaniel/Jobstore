require 'rails_helper'

RSpec.describe "Payments", type: :request do

  describe "GET /create" do
    it "returns http success" do
      get "/payments/create"
      expect(response).to have_http_status(:success)
    end
  end

end
