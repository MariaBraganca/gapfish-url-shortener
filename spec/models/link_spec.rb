require 'rails_helper'

RSpec.describe Link, type: :model do
  # url validations
  it { should have_db_column(:url)  }
  it { should validate_presence_of(:url)  }
  it { should allow_value("https://devs.gapfish.com").for(:url) }
  it { should validate_length_of(:url)  }

  # code validations
  it { should have_db_column(:code)  }
  it { should validate_uniqueness_of(:code) }
  it { should validate_length_of(:code)  }

  # create a link
  it "is valid with an url" do
    link = Link.new(
      url: "https://devs.gapfish.com"
      )
    link.save
    expect(link).to be_valid
  end

end
