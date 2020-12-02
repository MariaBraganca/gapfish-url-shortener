require 'rails_helper'

RSpec.describe Link, type: :model do
  # url validations
  it { should have_db_column(:url)  }
  it { should validate_presence_of(:url)  }
  it { should allow_value("https://www.gapfish.com").for(:url) }
  it { should validate_length_of(:url)  }

  # code validations
  it { should have_db_column(:code)  }
  it { should validate_presence_of(:code)  }
  it { should validate_uniqueness_of(:code) }

  # create a link
  it "is valid with a proper formated url and code" do
    link = Link.new(
      url: "https://www.gapfish.com",
      code: "guhaig9"
      )
    link.save
    expect(link).to be_valid
  end

  it "generates a link path with localhost and respective code" do
    link = Link.new(
      url: "https://www.gapfish.com",
      code: "guhaig9"
      )
    link.save
    expect(link.short_url).to eq("http://localhost:3000/#{link.code}")
  end

end
