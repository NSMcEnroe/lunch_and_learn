class TouristSiteSerializer
  include JSONAPI::Serializer
  set_id { nil }
  set_type :tourist_site
  attributes :name, :address, :place_id
end