class ForecastsSerializer
  include FastJsonapi::ObjectSerializer
  attributes :lon, :lng
end
