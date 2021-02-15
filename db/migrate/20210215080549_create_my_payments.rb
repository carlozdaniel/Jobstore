class CreateMyPayments < ActiveRecord::Migration[6.0]
  def change
    create_table :my_payments do |t|
      t.string :email
      t.string :ip
      t.string :status
      t.decimal :fee
      t.string :paypal_id
      t.decimal :total

      t.timestamps
    end
  end
end
