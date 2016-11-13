require 'rails_helper'

RSpec.describe "api/v1s/edit", type: :view do
  before(:each) do
    @api_v1 = assign(:api_v1, Bookmark.create!())
  end

  it "renders the edit api_v1 form" do
    render

    assert_select "form[action=?][method=?]", api_v1_path(@api_v1), "post" do
    end
  end
end
