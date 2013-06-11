require 'spec_helper'

describe StaticBlocks::StaticBlocksHelper do
  before do
    s = StaticBlocks::StaticBlock.create!({"title" => "foo", "content" => "bar", "status" => "published"})
  end

  describe "static_block helper" do
    it "should return content" do
      static_block_for("foo").should eq "bar"
    end
  end
end
