require "spec_helper"

feature "translations" do

  before do
    static_blocks = StaticBlocks::Snippet.create(title: 'foo', content: 'english bar', status: 'Published')
    visit "/static_blocks"
  end

  scenario "can create a translation" do
    click_link "wk"
    click_link "Edit"
    fill_in "snippet_content", :with => "wookie bar"
    click_button "Submit"
    page.should have_content("Static block was successfully updated.")
    click_link "List blocks"
    page.should have_content("wookie bar")
    page.should_not have_content("english bar")
    click_link "en"
    page.should have_content("english bar")
    page.should_not have_content("wookie bar")
  end

end
