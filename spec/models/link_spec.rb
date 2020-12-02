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
  it "is valid with an url and code" do
    link = Link.new(
      url: "https://www.gapfish.com",
      code: "guhaig9"
      )
    link.save
    expect(link).to be_valid
  end

  it "is invalid if it doesn't have a proper url format" do
    link = Link.new(url: "gapfish.com", code: "guhaig9")
    expect(link).not_to be_valid
  end

end
