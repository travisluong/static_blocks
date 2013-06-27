module StaticBlocks
  module StaticBlocksHelper
    def static_block_for(name, default = nil)
      Rails.cache.fetch("static_block::"+I18n.locale.to_s+"::"+name.to_s) do
        static_block = StaticBlock.published.find_by_title(name.to_s)
        if static_block
          static_block.content
        else
          "StaticBlock for #{name.to_s} missing"
        end
      end
    end

    def static_block_published?(name)
      Rails.cache.fetch("static_block::"+I18n.locale.to_s+"::"+name.to_s) do
        StaticBlock.published.find_by_title(name.to_s) || false
      end
    end

    alias_method :s, :static_block_for
  end
end
