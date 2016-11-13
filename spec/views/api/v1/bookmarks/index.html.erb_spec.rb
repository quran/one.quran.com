require 'rails_helper'

RSpec.describe "api/v1s/index", type: :view do
  before(:each) do
    assign(:bookmarks, [
      Bookmark.create!(),
      Bookmark.create!()
    ])
  end

  it "renders a list of api/v1s" do
    render
  end
end
