module StaticBlocks
  module SnippetsHelper
    def snippet_for(title, default = nil)
      Rails.cache.fetch("snippet::"+I18n.locale.to_s+"::"+title.to_s) do
        snippet = Snippet.published.find_by_title(title.to_s)
        if snippet
          snippet.content
        else
          "Snippet for #{title.to_s} missing"
        end
      end
    end

    def snippet_published?(title)
      Rails.cache.fetch("snippet::"+I18n.locale.to_s+"::"+title.to_s) do
        Snippet.published.find_by_title(title.to_s) || false
      end
    end

    alias_method :s, :snippet_for
  end
end
