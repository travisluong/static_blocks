# This migration comes from static_blocks (originally 20130611042319)
class CreateStaticBlocksStaticBlocks < ActiveRecord::Migration
  def change
    create_table :static_blocks_static_blocks do |t|
      t.string :title
      t.text :content
      t.string :status

      t.timestamps
    end
  end
end
