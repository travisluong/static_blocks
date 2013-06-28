require "spec_helper"

feature "csv import and export" do

  before do
    visit "/static_blocks"
    click_link "New block"
    fill_in "Title", :with => "foo"
    fill_in "Content", :with => "english bar"
    click_button "Submit"
  end

  scenario "can download a default csv before a translation" do
    click_link "Export"
    page.should have_content("id,title,content,status,created_at,updated_at")
    page.should have_content("1,foo,english bar,published,")
  end

  context "after a translation" do
    before do
      visit "/static_blocks"
      click_link "wk"
      click_link "Edit"
      fill_in "snippet_content", :with => "wookie bar"
      click_button "Submit"
    end

    scenario "the original static block fields will be changed after a translation" do
      click_link "Export"
      page.should have_content("id,title,content,status,created_at,updated_at")
      page.should have_content("1,foo,wookie bar,published,")
    end

    scenario "can download translations csv" do
      click_link "Export translations"
      page.should have_content("id,static_blocks_snippet_id,locale,content,created_at,updated_at")
      page.should have_content("1,1,en,english bar,")
      page.should have_content("2,1,wk,wookie bar,")
    end
  end
end
