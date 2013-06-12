module StaticBlocks
  module StaticBlocksHelper
    def static_block_for(name, default = nil)
      Rails.cache.fetch("static_block::"+name.to_s) do
        StaticBlock.published.find_by_title(name.to_s).content || default || "StaticBlock for #{name.to_s} missing"
      end
    end

    def static_block_published?(name)
      Rails.cache.fetch("static_block::"+name.to_s) do
        StaticBlock.published.find_by_title(name.to_s) || false
      end
    end

    alias_method :s, :static_block_for
  end
end

ActionView::Base.send(:include, StaticBlocks::StaticBlocksHelper)
