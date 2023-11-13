class TouristSite
  attr_reader :name, :address, :place_id
  def initialize(data)
    @name = data[:properties][:address_line1] || "No Name Given"
    @address = data[:properties][:formatted] || "No Address Given"
    @place_id = data[:properties][:place_id] 
  end
end