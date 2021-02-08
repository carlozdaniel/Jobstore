class CreateAttachments < ActiveRecord::Migration[6.0]
  def change
    create_table :attachments do |t|
      t.references :product, null: false, foreign_key: true
      t.attachment :archivo
      t.timestamps
    end
  end
end
