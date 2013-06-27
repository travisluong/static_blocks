module StaticBlocks
  module StaticBlocksHelper
    def static_block_for(title, default = nil)
      Rails.cache.fetch("static_block::"+I18n.locale.to_s+"::"+title.to_s) do
        static_block = StaticBlock.published.find_by_title(title.to_s)
        if static_block
          static_block.content
        else
          "StaticBlock for #{title.to_s} missing"
        end
      end
    end

    def static_block_published?(title)
      Rails.cache.fetch("static_block::"+I18n.locale.to_s+"::"+title.to_s) do
        StaticBlock.published.find_by_title(title.to_s) || false
      end
    end

    alias_method :s, :static_block_for
  end
end
