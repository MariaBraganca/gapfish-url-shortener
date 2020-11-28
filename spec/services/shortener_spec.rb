require "rails_helper"

RSpec.describe Shortener do

  it "generates a 7 character code for a given url" do
    url = "https://devs.gapfish.com"
    shortener = Shortener.new(url)
    expect(shortener.code.length).to eq(7)
  end

  it "generates different codes for each url" do
    url = "https://devs.gapfish.com"
    shortener = Shortener.new(url)
    first_code = shortener.code

    url = "https://gapfish.com/welcome/"
    shortener = Shortener.new(url)
    second_code = shortener.code

    expect(first_code).not_to eq(second_code)
  end

  it "generates Link record with an unique code" do
    url = "https://devs.gapfish.com"
    shortener = Shortener.new(url)

    first_link = shortener.generate_link
    expect(first_link).to be_valid

    second_link = shortener.generate_link
    expect(second_link).to be_valid
  end



end
