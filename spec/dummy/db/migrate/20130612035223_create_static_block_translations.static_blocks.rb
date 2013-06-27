# This migration comes from static_blocks (originally 20130612034816)
class CreateSnippetTranslations < ActiveRecord::Migration
  def up
    StaticBlocks::Snippet.create_translation_table!({
      content: :text
    }, {
      migrate_data: true
    })
  end

  def down
    Snippet.drop_translation_table! migrate_data: true
  end
end
