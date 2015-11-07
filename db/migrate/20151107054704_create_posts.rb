class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :description
      t.datetime :published_at
      t.boolean :active

      t.timestamps null: false
    end
  end
end
