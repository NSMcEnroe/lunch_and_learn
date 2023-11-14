require 'rails_helper'

describe PictureService do
  context "class methods" do
    context "#pictures_by_country" do
      it "returns images elated to the country", :vcr do
        france_pictures_data = PictureService.new.pictures_by_country("France")

        expect(france_pictures_data).to be_a Hash
        expect(france_pictures_data[:photos]).to be_an Array

        france = france_pictures_data[:photos].first

        expect(france[:alt]).to be_a(String)

        expect(france[:url]).to be_a(String)
      end
    end
  end
end