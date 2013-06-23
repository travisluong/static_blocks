require 'spec_helper'

feature "creating static blocks" do

  before do
    static_blocks = StaticBlocks::StaticBlock.create(title: 'foo', content: 'bar', status: 'Published')
    visit "/static_blocks_admin"
  end

  scenario "can see admin page" do
    page.should have_content('Static Blocks')
    page.should have_content('Listing static blocks')
  end

  scenario "can create new static block" do
    click_link "New"
    page.should have_content('New static block')
    fill_in "Title", :with => "baz"
    fill_in "Content", :with => "qux"
    select('Published', :from => "Status")
    click_button "Submit"
    page.should have_content('Static block was successfully created.')
    page.should have_content('baz')
    page.should have_content('qux')
    StaticBlocks::StaticBlock.count.should eq 2
  end

  scenario "can see static block on list page" do
    page.should have_content('foo')
  end
end

feature "editing and translating static blocks" do

  before do
    static_blocks = StaticBlocks::StaticBlock.create(title: 'foo', content: 'bar', status: 'Published')
    visit "/static_blocks_admin"
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
    static_blocks = StaticBlocks::StaticBlock.create(title: 'foo', content: 'bar', status: 'Published')
    visit "/static_blocks_admin"
  end

  scenario "can delete static block" do
    click_link "Destroy"
    page.should_not have_content('foo')
    StaticBlocks::StaticBlock.count.should eq 0
  end

end
