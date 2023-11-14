require  "rails_helper"

RSpec.describe LearningResource do
  it "exists" do
    attrs = {
        snippet: {
          title: "A"
        },
        id: {
          videoId: "B"
        }
      }

    attrs_2 =[
        { alt: "C",
        url: "D"
        },
        { alt: "E",
        url: "F"
        }
      ]
    

    thailand = LearningResource.new(attrs, attrs_2, "thailand")

    expect(thailand).to be_a LearningResource
    expect(thailand.video).to eq({ title: "A", youtube_video_id: "B"})
    expect(thailand.country).to eq("thailand")
    expect(thailand.images).to eq([{alt_tag: "C", url: "D" }, {alt_tag: "E", url: "F" }])
  end
end