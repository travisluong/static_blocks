require "spec_helper"

feature "search blocks" do

  before do
    visit "/static_blocks"
    click_link "New block"
    fill_in "Title", :with => "foo"
    fill_in "Content", :with => "english bar"
    click_button "Submit"
    click_link "List blocks"
  end

  scenario "can search default blocks" do
    fill_in "Content contains", :with => "english bar"
    click_button "Search"
    page.should have_content("english bar")
  end

  describe "search translated blocks" do

    before do
      visit "/static_blocks"
      click_link "wk"
      click_link "Edit"
      fill_in "snippet_content", :with => "wookie bar"
      click_button "Submit"
      click_link "List blocks"
    end

    scenario "can search translated blocks" do
      fill_in "Title contains", :with => "foo"
      fill_in "Content contains", :with => "wookie bar"
      select('Published', :from => "Status")
      click_button "Search"
      page.should have_content("wookie bar")
    end
  end
end


