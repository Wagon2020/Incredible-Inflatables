class CreateInflatables < ActiveRecord::Migration[6.0]
  def change
    create_table :inflatables do |t|
      t.string :name
      t.string :category
      t.string :location
      t.integer :price
      t.string :condition
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
