require "rails_helper"

RSpec.describe "Search for Tourist Sites", type: :request do
  it "should return a list of tourist sites related to France", :vcr do
    user_search = "France"

    get "/api/v1/tourist_sites?country=#{user_search}"

    expect(response).to be_successful

    tourist_sites_list_data = JSON.parse(response.body, symbolize_names: true)

    tourist_sites = tourist_sites_list_data[:data]

    tourist_sites.each do |tourist_site|
      expect(tourist_site).to have_key(:id)
      expect(tourist_site[:id]).to eq(nil)

      expect(tourist_site).to have_key(:type)
      expect(tourist_site[:type]).to eq("tourist_site")

      expect(tourist_site).to have_key(:attributes)
      expect(tourist_site[:attributes][:name]).to be_a(String)
      expect(tourist_site[:attributes][:address]).to be_a(String)
      expect(tourist_site[:attributes][:place_id]).to be_a(String)
    end
  end

  it "should return a list of tourist sites related to New Zealand", :vcr do
    user_search = "New Zealand"

    get "/api/v1/tourist_sites?country=#{user_search}"

    expect(response).to be_successful

    tourist_sites_list_data = JSON.parse(response.body, symbolize_names: true)

    tourist_sites = tourist_sites_list_data[:data]

    tourist_sites.each do |tourist_site|
      expect(tourist_site).to have_key(:id)
      expect(tourist_site[:id]).to eq(nil)

      expect(tourist_site).to have_key(:type)
      expect(tourist_site[:type]).to eq("tourist_site")

      expect(tourist_site).to have_key(:attributes)
      expect(tourist_site[:attributes][:name]).to be_a(String)
      expect(tourist_site[:attributes][:address]).to be_a(String)
      expect(tourist_site[:attributes][:place_id]).to be_a(String)
    end
  end

  it "should return a list of tourist sites related to Latvia", :vcr do
    user_search = "Latvia"

    get "/api/v1/tourist_sites?country=#{user_search}"

    expect(response).to be_successful

    tourist_sites_list_data = JSON.parse(response.body, symbolize_names: true)

    tourist_sites = tourist_sites_list_data[:data]

    tourist_sites.each do |tourist_site|
      expect(tourist_site).to have_key(:id)
      expect(tourist_site[:id]).to eq(nil)

      expect(tourist_site).to have_key(:type)
      expect(tourist_site[:type]).to eq("tourist_site")

      expect(tourist_site).to have_key(:attributes)
      expect(tourist_site[:attributes][:name]).to be_a(String)
      expect(tourist_site[:attributes][:address]).to be_a(String)
      expect(tourist_site[:attributes][:place_id]).to be_a(String)
    end
  end

  it "should return an empty array when given a sad path response", :vcr do
    user_search = "Antartica"

    get "/api/v1/tourist_sites?country=#{user_search}"

    expect(response).to be_successful

    tourist_sites_list_data = JSON.parse(response.body, symbolize_names: true)

    empty_hash = tourist_sites_list_data[:data]

    expect(empty_hash).to eq([])
  end
end