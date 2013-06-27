require 'spec_helper'

describe StaticBlocks::Snippet do
  before do
    @snippet = StaticBlocks::Snippet.create!({"title" => "foo", "content" => "bar", "status" => "published"})
  end

  subject { @snippet }

  it { should respond_to(:title) }
  it { should respond_to(:content) }
  it { should respond_to(:status) }
end
