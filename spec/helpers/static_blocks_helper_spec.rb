require 'spec_helper'

describe StaticBlocks::SnippetsHelper do
  before do
    s = StaticBlocks::Snippet.create!({"title" => "foo", "content" => "bar", "status" => "published"})
  end

  describe "snippet helper" do
    it "should return content" do
      snippet_for("foo").should eq "bar"
    end
  end
end
