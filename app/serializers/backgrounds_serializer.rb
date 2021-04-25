class BackgroundsSerializer
  include FastJsonapi::ObjectSerializer
  attributes :image, :credit
end
