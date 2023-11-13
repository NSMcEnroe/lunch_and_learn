require 'rails_helper'

RSpec.describe TouristSiteFacade do
  describe '#close_tourist_sites' do
    it 'returns an array of Tourist Site objects', :vcr do
        tourist_site_facade = TouristSiteFacade.new("France")

        tourist_sites = tourist_site_facade.close_tourist_sites

        expect(tourist_sites).to be_an(Array)
        expect(tourist_sites.first).to be_a(TouristSite)
    end
  end
end
