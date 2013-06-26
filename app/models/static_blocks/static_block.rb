module StaticBlocks
  class StaticBlock < ActiveRecord::Base
    attr_accessible :content, :status, :title
    after_save :clear_cache
    scope :published, where(:status => 'published')
    translates :content

    def to_s
      content
    end

    def clear_cache
      Rails.cache.delete("static_block::"+title)
    end

    def self.to_csv(options = {})
      CSV.generate(options) do |csv|
        csv << column_names
        all.each do |product|
          csv << product.attributes.values_at(*column_names)
        end
      end
    end

    def self.get_all_translations
      self.connection.select_all('select * from static_blocks_static_block_translations')
    end

    def self.translations_to_csv(options = {})
      translations = get_all_translations
      translation_column_names = translations.first.keys
      CSV.generate(options) do |csv|
        csv << translation_column_names
        translations.each do |t|
          csv << t.values_at(*translation_column_names)
        end
      end
    end
  end
end
