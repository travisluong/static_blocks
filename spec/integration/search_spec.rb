require "spec_helper"

feature "search snippets" do

  before do
    visit "/static_blocks"
    click_link "New snippet"
    fill_in "Title", :with => "foo"
    fill_in "Content", :with => "english bar"
    click_button "Submit"
    click_link "List snippets"
  end

  scenario "can search default snippets" do
    fill_in "Content contains", :with => "english bar"
    click_button "Search"
    page.should have_content("english bar")
  end

  describe "search translated snippets" do

    before do
      visit "/static_blocks"
      click_link "wk"
      click_link "Edit"
      fill_in "snippet_content", :with => "wookie bar"
      click_button "Submit"
      click_link "List snippets"
    end

    scenario "can search translated snippets" do
      fill_in "Title contains", :with => "foo"
      fill_in "Content contains", :with => "wookie bar"
      select('Published', :from => "Status")
      click_button "Search"
      page.should have_content("wookie bar")
    end
  end
end


