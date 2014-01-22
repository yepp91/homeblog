class CreateTag2articles < ActiveRecord::Migration
  def change
    create_table :tag2articles do |t|
      t.belongs_to :Article
      t.belongs_to :Tags

      t.timestamps
    end
    add_index :tag2articles, :Article_id
    add_index :tag2articles, :Tags_id
  end
end
