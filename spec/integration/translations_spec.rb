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
    click_link "List snippets"
    page.should have_content("wookie bar")
    page.should_not have_content("english bar")
    click_link "en"
    page.should have_content("english bar")
    page.should_not have_content("wookie bar")
  end

  scenario "should not have translations if globalize config false" do
    page.should have_content("Import translations")
    page.should have_content("Export translations")
    StaticBlocks.config.globalize = false
    visit "/static_blocks"
    page.should_not have_content("Import translations")
    page.should_not have_content("Export translations")
  end

end
