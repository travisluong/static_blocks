class CreateStaticBlocksSnippets < ActiveRecord::Migration
  def change
    create_table :static_blocks_snippets do |t|
      t.string :title
      t.text :content
      t.string :status

      t.timestamps
    end
  end
end
