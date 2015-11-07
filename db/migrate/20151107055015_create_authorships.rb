class CreateAuthorships < ActiveRecord::Migration
  def change
    create_table :authorships do |t|
      t.references :author, index: true
      t.references :post, index: true

      t.timestamps null: false
    end
    add_foreign_key :authorships, :authors
    add_foreign_key :authorships, :posts
  end
end
