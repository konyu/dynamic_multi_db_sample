class CreateAddress < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.integer :user_id
      t.string :post_number
      t.string :detail

      t.timestamps null: false
    end
  end
end
