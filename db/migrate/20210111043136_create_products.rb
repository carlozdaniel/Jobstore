class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :pricing, scale: 2, precision: 10
      t.text :description
      t.references :user, null: false, foreign_key: true
      t.attachment :avatar
      t.timestamps
    end
  end
end
