module StaticBlocks
  class StaticBlock < ActiveRecord::Base
    attr_accessible :content, :status, :title
  end
end
