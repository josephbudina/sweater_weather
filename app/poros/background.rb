class Background
  attr_reader :id,
              :image,
              :credit

  def initialize(data)
    @id = nil
    @image = data[:image_url]
    @credit = data[:credit]
  end
end