require 'rails_helper'

RSpec.describe LearningResourcesFacade do
  describe '#selected_resources' do
    it 'returns a Learning Resource object', :vcr do
        fiji_resources = LearningResourcesFacade.new("Fiji").selected_resources

        expect(fiji_resources).to be_a(LearningResource)
    end
  end
end
