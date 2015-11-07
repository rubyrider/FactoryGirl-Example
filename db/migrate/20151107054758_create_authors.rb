class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :name
      t.text :about
      t.string :sub_title
      t.boolean :active

      t.timestamps null: false
    end
  end
end
