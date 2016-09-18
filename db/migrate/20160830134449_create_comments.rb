# CreateComments
class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :post_id
      t.string :body
      t.boolean :approved, default: false
      t.timestamp :approved_at
      t.timestamps null: false
    end
  end
end
