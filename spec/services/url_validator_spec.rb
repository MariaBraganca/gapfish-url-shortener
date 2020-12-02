require 'rails_helper'

RSpec.describe UrlValidator do |variable|

  it "is valid if URL protocol includes HTTP" do
    input = "http://gapfish.com"

    url = URI.parse(input)
    expect(url.scheme).to eq('http')
    expect(url.host).to eq('gapfish.com')

    shortener = Shortener.new(input)
    link = shortener.generate_link

    expect(link).to be_valid
  end

  it "is valid if URL protocol includes HTTPS" do
    input = "https://gapfish.com"

    url = URI.parse(input)
    expect(url.scheme).to eq('https')
    expect(url.host).to eq('gapfish.com')

    shortener = Shortener.new(input)
    link = shortener.generate_link

    expect(link).to be_valid
  end

  it "is invalid without URL protocol" do
    input = "gapfish.com"

    url = URI.parse(input)
    expect(url.scheme).to be_nil
    expect(url.host).to be_nil

    shortener = Shortener.new(input)
    link = shortener.generate_link

    expect(link).not_to be_valid
  end

end
