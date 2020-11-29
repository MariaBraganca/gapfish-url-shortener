require 'rails_helper'

RSpec.describe LinksController, type: :controller do

  it "can generate a link provided by user" do
    url = "https://devs.gapfish.com"

    request.env["HTTP_ACCEPT"] = "text/javascript"

    post :create, params: { link: { url: url } }
    link = assigns(:link)

    expect(link.url).to eq(url)
    expect(link).to be_valid
    expect(link.code.length).to eq(7)

    expect(response).to render_template('create')
  end

end
