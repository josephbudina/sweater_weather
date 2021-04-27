class ImageSerializer
  include FastJsonapi::ObjectSerializer
  attributes :image, :credit
end
