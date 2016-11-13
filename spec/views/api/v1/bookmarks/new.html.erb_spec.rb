require 'rails_helper'

RSpec.describe "api/v1s/new", type: :view do
  before(:each) do
    assign(:api_v1, Bookmark.new())
  end

  it "renders new api_v1 form" do
    render

    assert_select "form[action=?][method=?]", bookmarks_path, "post" do
    end
  end
end
