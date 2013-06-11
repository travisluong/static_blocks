module StaticBlocks
  class StaticBlock < ActiveRecord::Base
    attr_accessible :content, :status, :title
    after_save :clear_cache
    scope :published, where(:status => 'published')

    def to_s
      content
    end

    def clear_cache
      Rails.cache.delete("static_block::"+title)
    end
  end
end
