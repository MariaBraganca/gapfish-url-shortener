require 'rails_helper'

RSpec.describe "Link redirection", type: :request do

  it "redirects a short url to the original url" do
    url = "https://devs.gapfish.com"
    shortener = Shortener.new(url)
    link = shortener.generate_link

    get link.short_url

    expect(response).to redirect_to(link.url)
  end

end
