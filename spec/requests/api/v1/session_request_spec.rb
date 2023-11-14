require "rails_helper"

describe "Sessions API" do
  it "can register a user", :vcr do
    user_info = {
      "name": "Odell",
      "email": "goodboy@ruffruff.com",
      "password": "treats4lyf",
      "password_confirmation": "treats4lyf"
    }

    post "/api/v1/users", params: user_info, as: :json 

    session_info = {
      "email": "goodboy@ruffruff.com",
      "password": "treats4lyf",
    }

    post "/api/v1/sessions", params: session_info, as: :json

    expect(response.status).to eq(200)

    user_session = JSON.parse(response.body, symbolize_names: true)

    user_session_data = user_session[:data]

    expect(user_session_data).to have_key :type
    expect(user_session_data[:type]).to eq("user")

    expect(user_session_data).to have_key :attributes

    expect(user_session_data[:attributes]).to have_key :name
    expect(user_session_data[:attributes][:name]).to eq("Odell")

    expect(user_session_data[:attributes]).to have_key :email
    expect(user_session_data[:attributes][:email]).to eq("goodboy@ruffruff.com")

    expect(user_session_data[:attributes]).to have_key :api_key
    expect(user_session_data[:attributes][:api_key]).to eq(User.last.api_key)
  end

  it "returns an error if the username is not found in the database" do
    session_info = {
      "email": "goodboy@ruffruff.com",
      "password": "treats4lyf",
    }

    post "/api/v1/sessions", params: session_info, as: :json

    expect(response.status).to eq(400)

    expect(response.body).to eq("{\"errors\":\"Invalid Login\"}")
  end

  it "returns an error if the password does not match with the database" do
    user_info = {
      "name": "Odell",
      "email": "goodboy@ruffruff.com",
      "password": "treats4lyf",
      "password_confirmation": "treats4lyf"
    }

    post "/api/v1/users", params: user_info, as: :json 

    session_info = {
      "email": "goodboy@ruffruff.com",
      "password": "treats4ly",
    }

    post "/api/v1/sessions", params: session_info, as: :json

    expect(response.status).to eq(400)

    expect(response.body).to eq("{\"errors\":\"Invalid Login\"}")
  end
end
