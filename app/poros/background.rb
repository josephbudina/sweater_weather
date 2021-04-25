class Background
  attr_reader :id,
              :image,
              :credit

  def initialize(data)
    @id = nil
    @image = data
    @credit = data
  end
end