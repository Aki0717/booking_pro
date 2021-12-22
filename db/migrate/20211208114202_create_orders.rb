class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :name            ,null:false
      t.string :mail            ,null:false
      t.string :phone_number    ,null:false
      t.string :price           ,null:false
      t.references :book        ,foreign_key: true
      t.timestamps
    end
  end
end
