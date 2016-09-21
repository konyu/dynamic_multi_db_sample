class CreateAddrres < ActiveRecord::Migration
  def change
    create_table :addrres do |t|
      t.integer :user_id
      t.string :post_number
      t.string :detail

      t.timestamps null: false
    end
  end
end
