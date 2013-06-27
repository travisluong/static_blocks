require 'spec_helper'

feature "creating snippets" do

  before do
    static_blocks = StaticBlocks::Snippet.create(title: 'foo', content: 'bar', status: 'Published')
    visit "/static_blocks"
  end

  scenario "can see admin page" do
    page.should have_content('Static Blocks')
    page.should have_content('Listing snippets')
  end

  scenario "can create new static block" do
    click_link "New"
    page.should have_content('New snippet')
    fill_in "Title", :with => "baz"
    fill_in "Content", :with => "qux"
    select('Published', :from => "Status")
    click_button "Submit"
    page.should have_content('Snippet was successfully created.')
    page.should have_content('baz')
    page.should have_content('qux')
    StaticBlocks::Snippet.count.should eq 2
  end

  scenario "can see static block on list page" do
    page.should have_content('foo')
  end
end

feature "editing and translating static blocks" do

  before do
    snippet = StaticBlocks::Snippet.create(title: 'foo', content: 'bar', status: 'Published')
    visit "/static_blocks"
  end

  scenario "can edit and translate static block" do
    click_link "Edit"
    find_field('Title').value.should eq 'foo'
    find_field('Content').value.should eq 'bar'
    click_link "wk"
    fill_in 'Content', :with => "argh"
    click_button 'Submit'
    page.should have_content('argh')
    page.should_not have_content('bar')
    click_link 'en'
    page.should have_content('bar')
    page.should_not have_content('argh')
  end
end

feature "deleting static blocks" do

  before do
    snippet = StaticBlocks::Snippet.create(title: 'foo', content: 'bar', status: 'Published')
    visit "/static_blocks"
  end

  scenario "can delete static block" do
    click_link "Destroy"
    page.should_not have_content('foo')
    StaticBlocks::Snippet.count.should eq 0
  end

end
