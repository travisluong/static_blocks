module StaticBlocks
  class Snippet < ActiveRecord::Base
    attr_accessible :content, :status, :title
    after_save :clear_cache
    scope :published, where(:status => 'published')
    translates :content
    validates :title, uniqueness: true

    def to_s
      content
    end

    def clear_cache
      Rails.cache.delete("snippet::"+I18n.locale.to_s+"::"+title)
    end

    def self.to_csv(options = {})
      snippets = self.connection.select_all('select * from static_blocks_snippets')
      snippets_column_names = snippets.first.keys
      CSV.generate(options) do |csv|
        csv << snippets_column_names
        snippets.each do |s|
          csv << s.values_at(*snippets_column_names)
        end
      end
    end

    def self.translations_to_csv(options = {})
      translations = self.connection.select_all('
        SELECT s.title, t.* FROM static_blocks_snippet_translations t
        INNER JOIN static_blocks_snippets s
        ON t.static_blocks_snippet_id = s.id
        ')
      if translations.empty?
        flash[:error] = "There are no translations"
        return
      end
      translation_column_names = translations.first.keys
      CSV.generate(options) do |csv|
        csv << translation_column_names
        translations.each do |t|
          csv << t.values_at(*translation_column_names)
        end
      end
    end

    def self.import(file)
      CSV.foreach(file.path, headers: true) do |row|
        snippet = find_by_title(row["title"]) || new
        snippet.attributes = row.to_hash.slice(*accessible_attributes)
        snippet.save!
      end
    end

    def self.import_translations(file)
      # delete all translations
      delete_sql = "DELETE FROM static_blocks_snippet_translations"
      translation = ActiveRecord::Base.connection.execute(delete_sql)

      # add all translations
      CSV.foreach(file.path, headers: true) do |row|
        static_block = find_by_title(row['title'])

        # return if nil
        # we don't want to update or insert a translation if the snippet doesn't exist
        return if static_block.nil?

        # create new translation
        sql_array = ["
        INSERT INTO static_blocks_snippet_translations
        (static_blocks_snippet_id, locale, content, created_at, updated_at) VALUES
        (?, ?, ?, ?, ?)", static_block.id, row['locale'], row['content'], row['created_at'], row['updated_at']]
        insert_sql = sanitize_sql_array(sql_array)

        ActiveRecord::Base.connection.execute(insert_sql)

        # manually clear the cache for that snippet
        Rails.cache.delete("snippet::#{row['locale']}::#{row['title']}")
      end
    end
  end
end
