class Shortener

  attr_reader :url, :link_model

  def initialize(url, link_model = Link)
    @url = url
    @link_model = link_model
  end

  # generate a link instance
  def generate_link
    link_model.create(url: url, code: code)
  end

  def code
    loop do
      code = get_new_code
      break code unless link_model.exists?(code: get_new_code)
    end
  end

  # generates a new code, example: "guhaig9"
  def get_new_code
    SecureRandom.uuid[0..6]
  end

end
