context "class methods" do
  context "#video_by_country" do
    it "returns a video related to the country", :vcr do
      france_video_data = VideoService.new.video_by_country("France")

      expect(france_video_data).to be_a Hash
      expect(france_video_data[:items]).to be_an Array

      expect(france_video_data[:items][0]).to have_key :id
      expect(france_video_data[:items][0][:id]).to have_key :videoId
      expect(france_video_data[:items][0][:id][:videoId]).to be_a(String)

      expect(france_video_data[:items][0]).to have_key :snippet
      expect(france_video_data[:items][0][:snippet]).to have_key :title
      expect(france_video_data[:items][0][:snippet][:title]).to be_a(String)
    end
  end
end