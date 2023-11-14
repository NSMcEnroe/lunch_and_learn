require "rails_helper"

RSpec.describe "Get Learning Resources for a Country", type: :request do
  it "should return learning resources for Thailand", :vcr do
    user_search = "laos"

    get "/api/v1/learning_resources?country=#{user_search}"

    expect(response).to be_successful

    learning_resources_data = JSON.parse(response.body, symbolize_names: true)

    json_data = learning_resources_data[:data]

    expect(json_data).to have_key(:id)
    expect(json_data[:id]).to eq(nil)

    expect(json_data).to have_key(:type)
    expect(json_data[:type]).to eq("learning_resource")

    expect(json_data).to have_key(:attributes)
    expect(json_data[:attributes][:country]).to eq("laos")
    
    expect(json_data[:attributes]).to have_key(:video)
    expect(json_data[:attributes][:video][:title]).to be_a(String)
    expect(json_data[:attributes][:video][:youtube_video_id]).to be_a(String)

    expect(json_data[:attributes]).to have_key(:images)
    expect(json_data[:attributes][:images][:alt_tag]).to be_a(String, count: 10)
    expect(json_data[:attributes][:images][:url]).to be_a(String, count: 10)

      # expect(recipe[:attributes]).to_not have_key :yield
      # expect(recipe[:attributes]).to_not have_key :ingredients
      # expect(recipe[:attributes]).to_not have_key :images
      
    end
  end