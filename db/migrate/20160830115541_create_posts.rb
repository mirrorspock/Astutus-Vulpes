class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.string :body
      t.string :slug, null: false
      t.string :state, default: 'draft', null: false
      t.integer :author_id, null: false
      t.integer :comments_count, default: 0
      t.timestamp :published_at
      t.timestamps null: false
    end
  end
end
