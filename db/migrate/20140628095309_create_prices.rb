class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.decimal :price
      t.timestamp :start_at
      t.references Product
      t.timestamps
    end
  end
end
