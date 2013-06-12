# This migration comes from static_blocks (originally 20130612034816)
class CreateStaticBlockTranslations < ActiveRecord::Migration
  def up
    StaticBlocks::StaticBlock.create_translation_table!({
      content: :text
    }, {
      migrate_data: true
    })
  end

  def down
    StaticBlock.drop_translation_table! migrate_data: true
  end
end
