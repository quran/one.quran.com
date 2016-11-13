require 'rails_helper'

RSpec.describe "api/v1s/show", type: :view do
  before(:each) do
    @api_v1 = assign(:api_v1, Bookmark.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
