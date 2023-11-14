require "rails_helper"
  describe "User API" do
    it "can register a user", :vcr do
      user_info = {
        "name": "Odell",
        "email": "goodboy@ruffruff.com",
        "password": "treats4lyf",
        "password_confirmation": "treats4lyf"
      }

      post "/api/v1/users", params: user_info, as: :json 

      expect(response.status).to eq(201)

      single_user = JSON.parse(response.body, symbolize_names: true)

      saved_user_data = single_user[:data]

      expect(saved_user_data).to have_key :type
      expect(saved_user_data[:type]).to eq("user")

      expect(saved_user_data).to have_key :attributes

      expect(saved_user_data[:attributes]).to have_key :name
      expect(saved_user_data[:attributes][:name]).to eq("Odell")

      expect(saved_user_data[:attributes]).to have_key :email
      expect(saved_user_data[:attributes][:email]).to eq("goodboy@ruffruff.com")

      expect(saved_user_data[:attributes]).to have_key :api_key
      expect(saved_user_data[:attributes][:api_key]).to be_a(String)
    end 
  end




