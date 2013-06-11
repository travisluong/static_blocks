require 'spec_helper'

describe StaticBlocks::StaticBlock do
  before do
    @static_block = StaticBlocks::StaticBlock.create!({"title" => "foo", "content" => "bar", "status" => "published"})
  end

  subject { @static_block }

  it { should respond_to(:title) }
  it { should respond_to(:content) }
  it { should respond_to(:status) }
end
